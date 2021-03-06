

---------------------Configuration variables. Feel free to change these.---------------------


--Rate at which to heal walls. Increase to speed up rate of healing.
heal = 50

--What cut of the total walls to heal per tick. Default is 1/100, meaning that it will take
--100 ticks to heal all of your walls, regardless of how many walls that is. If you change it,
--please keep in mind that a higher fraction = faster healing AND slower game performance.
--Also remember that some mega-factories might have thousands of these walls, so 1/100 could
--actually be a lot of walls. Also also, 1/100 means each wall heals about once per second.
portionOfTotalWallsPerTick = 1/100

--How many invalid walls should be allowed to be in our list before we
--consolidate the table to speed up iteration. Keep in mind, consolidation takes time,
--but it can save time in the long run. If this is too high, you'll have gaps in healing -
--meaning ticks where only invalid walls are processed and as a result, no real walls heal.
consolidationThreshold = 50

--How often to heal walls. The healing process will wait this many ticks between heals.
healDelay = 1


--------------------------Program variables. Don't mess with these.--------------------------


--Storage for walls so we don't have to repeatedly search.
wallList = {}

--Index of the wall we're checking next tick.
currentIndex = 1

--How many walls in the list are invalid.
invalidWalls = 0


----------------------------------------Functions--------------------------------------------


--Called every tick. Process the next wall in the list, and heal it.
function regen_walls(event)
  if event.tick % healDelay == 0 and #wallList > 0 then
    --Loop if we're doing more than one wall per tick
    for i = 1, 2 + math.floor(#wallList * portionOfTotalWallsPerTick), 1 do
      --Every 10 seconds or so, if the list is too small to trigger the threshold, clean it anyway
      --This way, if you get rid of all of your walls, you can stop this mod from having any
      --performance impact whatsoever because #wallList will be consolidated to 0.
      if #wallList <= consolidationThreshold and event.tick % 1000 and invalidWalls > 0 then
        consolidateWallList()
        currentIndex = 1
        invalidWalls = 0
      end

      --If we're past the end of the list
      if currentIndex > #wallList then
        --Reset to the first wall
        currentIndex = 1
        --And don't double-count any invalid walls
        invalidWalls = 0
      end
      
      --Store wall for efficiency boost (no table lookup required)
      local wall = wallList[currentIndex]
      --If the wall has neither been deleted from the table nor destructed in the game
      if wall ~= nil and wall.valid then
        --Heal it
        wall.health = wall.health + heal
        --Move on to the next wall
        currentIndex = currentIndex + 1
      --Otherwise
      else
        --Delete this wall from the list (does nothing if already deleted)
        wallList[currentIndex] = nil
        --Count it as deleted
        invalidWalls = invalidWalls + 1
        --Move on to the next wall
        currentIndex = currentIndex + 1
        --If the wall list is to holey, consolidate it to remove bad indices and speed up iteration
        if invalidWalls > consolidationThreshold then
          consolidateWallList()
          currentIndex = 1
          invalidWalls = 0
        end
      end
    end
  end
end

--Runs when a wall is built
function addWall(event)
  --If the wall is part of this mod
  if event.created_entity.name == "shielded-wall"
     or event.created_entity.name == "repulsor-wall"
     or event.created_entity.name == "shielded-gate"
     or event.created_entity.name == "repulsor-gate" then
    --Add the wall to our list of walls
    table.insert(wallList, event.created_entity)
  end
end

--After enough walls have been built and destructed, there will be delays in healing
--since we will be attempting to heal nonexistent walls in some ticks. This function
--will rebuild the wall list, removing holes and invalid walls to speed up healing.
function consolidateWallList()
  --New wall list we're constructing
  local newTable = {}
  --Iterate through the values in the list, ignoring nil values (invalid walls)
  for _, v in pairs(wallList) do
    --Add this *valid* wall to the new wall list
    table.insert(newTable, v)
  end
  --Replace old wall list with the new one
  wallList = newTable
end

--Heal some walls each tick
script.on_event(defines.events.on_tick, regen_walls)

--Add a wall to the list when it is built
script.on_event(defines.events.on_built_entity, addWall)
