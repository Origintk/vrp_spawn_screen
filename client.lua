--[[ 
	vrp_spawn_screen
    Copyright (C) 2018  VHdk

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ]]

male_models = {'mp_m_freemode_01'}
female_models = {'mp_f_freemode_01'}

RegisterNetEvent("vrp_spawn_screen:spawn")
AddEventHandler("vrp_spawn_screen:spawn", function(source, gender)
    if gender == "1" then
      model = GetHashKey(male_models[ math.random( #male_models ) ] )
    elseif gender == "0" then
      model = GetHashKey(female_models[ math.random( #female_models ) ] )
    end

    RequestModel(model)
    while not HasModelLoaded(model) do
      Citizen.Wait(1000)
    end
    SetPlayerModel(PlayerId(), model)
   -- SetPedRandomComponentVariation(GetPlayerPed(-1), true)
    SetModelAsNoLongerNeeded(model)
		
    SetEntityCoords(GetPlayerPed(-1), tonumber("-1043.94"), tonumber("-2748.265"), tonumber("21.36"), 1, 0, 0, 1)
end)
