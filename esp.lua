--[[ 
    ESP library made by tested#0001 & tatar0071#0627
    You do not got permisssion to use this.
]]

-- // Services
local get_service = game.GetService; 
local tween = get_service(game, "TweenService");
local players = get_service(game, "Players");
local run_service = get_service(game, "RunService");
local user_input_service = get_service(game, "UserInputService");
local replicated_storage = get_service(game, "ReplicatedStorage");

-- // Variables
local new_vector2 = Vector2.new;
local new_vector3 = Vector3.new;
local new_uidm2 = UDim2.new;
local new_cframe = CFrame.new;
local cframe_angles = CFrame.Angles;
local math_round = math.round;
local math_floor = math.floor;
local math_random = math.random;
local math_tan = math.tan;
local math_rad = math.rad;
local math_atan2 = math.atan2;
local math_huge = math.huge;
local math_cos = math.cos;
local math_sin = math.sin;
local color_new = Color3.new;
local color_fromrgb = Color3.fromRGB;
local table_insert = table.insert;
local table_find = table.find;
local task_wait = task.wait;
local task_spawn = task.spawn;
local task_delay = task.delay;
local connect = game.Changed.Connect;
local localplayer = players.LocalPlayer;
local camera = workspace.CurrentCamera;
local mouse = localplayer:GetMouse();

-- // Namecalls
local find_first_child = workspace.FindFirstChild;
local find_first_child_of_class = workspace.FindFirstChildOfClass;
local world_to_view_port = camera.WorldToViewportPoint;
local point_to_object_space = CFrame.identity.PointToObjectSpace;
local point_to_world_space = CFrame.identity.PointToWorldSpace;
local get_children = game.GetChildren;
local get_players = players.GetPlayers;
local get_descendants = game.GetDescendants;
local is_descendant_of = game.IsDescendantOf;
local raycast = workspace.Raycast;
local create_render_object = debug.getupvalue(Drawing.new, 1);
local set_render_property = debug.getupvalue(debug.getupvalue(Drawing.new, 7).__newindex, 4);
local get_render_property = debug.getupvalue(debug.getupvalue(Drawing.new, 7).__index, 4);
local destroy_render_object = debug.getupvalue(debug.getupvalue(Drawing.new, 7).__index, 3);
local rotate_vector = function(v2, r) 
    local c = math_cos(math_rad(r)); 
    local s = math_sin(math_rad(r)); 
    return new_vector2(c * v2.X - s*v2.Y, s*v2.X + c*v2.Y); 
end;
local bodyParts = {"Head", "Left Arm", "Right Arm", "Left Arm", "Left Leg", "Right Leg", "Torso","LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot", "UpperTorso", "LowerTorso"}

-- // Library
local library = {
    settings = {
        enabled = false;
        max_distance = 1000;
        box = {
            enabled = false; 
            color = color_fromrgb(255, 255, 255);
            outline_color = color_fromrgb(0, 0, 0);
            style = "Square";
            type = "Dynamic";
        };
        healthbar = {
            enabled = false; 
            position = "Left";
            empty = color_fromrgb(255, 0, 0);
            color = color_fromrgb(21, 255, 0);
            outline_color = color_fromrgb(0, 0, 0);
        };
        name = {
            enabled = false; 
            position = "Top";
            color = color_fromrgb(255, 255, 255);
            outline_color = color_fromrgb(0, 0, 0);
            surround = "";
        };
        viewangle = {
            enabled = false; 
            color = color_fromrgb(255, 255, 255);
        };
        distance = {
            enabled = false; 
            position = "Top";
            color = color_fromrgb(255, 255, 255);
            outline_color = color_fromrgb(0, 0, 0);
            surround = "";
        };
        health = {
            enabled = false; 
            position = "Left";
            more_data = false;
            auto_color = false;
            color = color_fromrgb(255, 255, 255);
            outline_color = color_fromrgb(0, 0, 0);
            surround = "";
        };
        weapon = {
            enabled = false; 
            position = "Bottom";
            color = color_fromrgb(255, 255, 255);
            outline_color = color_fromrgb(0, 0, 0);
            surround = "";
        };
        chams = {
            enabled = false; 
            outline_color = color_fromrgb(0, 0, 0);
            in_vis_color = color_fromrgb(255, 0, 0);
            color = color_fromrgb(255, 255, 255);
            transparency = 0;
            outline_transparency = 0;
            pulse = false;
            type = "Highlight";
        };
        offscreen_arrow = {
            enabled = false; 
            color = color_fromrgb(255, 255, 255);
            invis_color = color_fromrgb(255, 0, 0);
            outline_color = color_fromrgb(0, 0, 0);
            radius = 200;
            size = 20;
            indicators = {};
            arrow_options = {};
            type = "Arrow";
        };
        offscreen_tracer = {
            enabled = false; 
            color = color_fromrgb(255, 255, 255);
            outline_color = color_fromrgb(0, 0, 0);
            origin = "Bottom";
            target = "Head";
            outline = false;
            tracer_danger_distance = 500;
        };
        measurements = {
            ["Meters"] = {"m", 1};
            ["Centimetres"] = {"cm", 3.5714285714};
            ["Decimetres"] = {"dm", 10};
            ["Feet"] = {"ft", 3.2808};
            ["Inches"] = {"in", 39.3701};
            ["Kilometres"] = {"km", 0.001};
            ["Miles"] = {"mi", 0.000621371};
            ["Yards"] = {"yd", 1.09361};
            ["Millimetres"] = {"mm", 1000};
            ["Nanometres"] = {"nm", 1000000000};
            ["Nautical miles"] = {"nmi", 0.00053996};
            ["Micrometres"] = {"um", 1000000};
            ["Fathom"] = {"f", 0.546807};
            ["Rods"] = {"r", 0.198839};
            ["Leagues"] = {"l", 0.00020712};
            ["Furlongs"] = {"fur", 0.00497097};
            ["Astronomical units"] = {"au", 0.000000000007};
            ["Light years"] = {"ly", 0.00000000000000010570234};
            ["Parsecs"] = {"pc", 0.00000000000000003240779};
        };
        font = "Monospace";
        font_size = 15;
        conversion = "Meters";
        use_display_name = false;
    };
    overrides = {};
    cache = {};
    whitelist = {};
    blacklist = {};
    checks = {};
}; library.__index = library;

-- // Functions
do
    library.to_vector = function(v3)
        return new_vector2(v3.X, v3.Y);
    end;
    -- 
    library.rotate_vector = function(v2, r)
        local c = math_cos(math_rad(r)); 
        local s = math_sin(math_rad(r)); 
        return new_vector2(c * v2.X - s * v2.Y, s * v2.X + c * v2.Y);
    end;
    --
    library.to_rot = function(angle) 
        return new_vector2(math_sin(math_rad(angle)), math_cos(math_rad(angle))) 
    end;
    -- 
    library.round = function(val)
        if typeof(val) == "number" then
            return math_floor(val);
        elseif typeof(val) == "Vector2" then
            return new_vector2(math_round(val.X), math_round(val.Y));
        end;
    end;
    -- 
    library.get_bounding_box = function(part) 
        local position, size = part.CFrame, part.Size;
        local X, Y, Z = size.X, size.Y, size.Z
        return {
            TBRC = position * new_cframe(X, Y * 1.3, Z),
            TBLC = position * new_cframe(-X, Y * 1.3, Z),
            TFRC = position * new_cframe(X, Y * 1.3, -Z),
            TFLC = position * new_cframe(-X, Y * 1.3, -Z),
            BBRC = position * new_cframe(X, -Y * 1.6, Z),
            BBLC = position * new_cframe(-X, -Y * 1.6, Z),
            BFRC = position * new_cframe(X, -Y * 1.6, -Z),
            BFLC = position * new_cframe(-X, -Y * 1.6, -Z),
        };
    end;
    -- 
    library.surround_string = function(str, surround)
        if not surround or surround == "" then
            return str;
        end;
        local a, b = surround:match("(.)(.)");
        return a .. str .. b;
    end;
    --
    library.pass_through = function(from, target, raycast_params, ignore_table)
        raycast_params.FilterDescendantsInstances = ignore_table;
        local result = raycast(workspace, from, (target.Position - from).unit * 10000, raycast_params);
        if result then
            local instance = result.Instance
            if is_descendant_of(instance, target.Parent)  then
                passed = true;
                return true;
            elseif instance.CanCollide == false or instance.Transparency == 1 then
                if instance.Name ~= "Head" and instance.Name ~= "HumanoidRootPart" then
                    table_insert(ignore_table, instance);
                    library.pass_through(result.Position, target, raycast_params, ignore_table);
                end;
            end;
        end;
    end;
    --
    library.check_visible = function(target, from_head)
        if not localplayer.Character then return false; end;
        if not target.Position then return false; end;
        if not find_first_child(localplayer.Character, "Head") then return false; end;

        local ignore_table = {camera, localplayer.Character}
        local raycast_params = RaycastParams.new();
        raycast_params.FilterType = Enum.RaycastFilterType.Blacklist;
        raycast_params.FilterDescendantsInstances = ignore_table;
        raycast_params.IgnoreWater = true;
        --
        local from = from_head and localplayer.Character.Position or camera.CFrame.p;
        local result = workspace:Raycast(from, (target.Position - from).unit * 10000, raycast_params);
        passed = false;
        if result then
            local instance = result.Instance;
            if is_descendant_of(instance, target.Parent)  then
                return true;
            elseif instance.CanCollide == false or instance.Transparency == 1 then
                if instance.Name ~= "Head" and instance.Name ~= "HumanoidRootPart" then
                    table_insert(ignore_table, instance);
                    library.pass_through(result.Position, target, raycast_params, ignore_table);
                end;
            end;
        end;
        return passed;
    end;
    --
    library.connection = function(signal, func)
        local con = connect(signal, func);
        return con;
    end;
end;

-- // Overrides 
do
    library.get_character = function(plr)
        if library.overrides.get_character ~= nil then
            return library.overrides.get_character(plr);
        end;
        return plr.Character;
    end;
    -- 
    library.get_team = function(plr)
        if library.overrides.get_team ~= nil then
            return library.overrides.get_team(plr);
        end;
        return plr.Team;
    end;
    -- 
    library.get_parts = function(plr)
        if library.overrides.get_parts ~= nil then
            return library.overrides.get_parts(plr);
        end;
        local character = library.get_character(plr);
        if character then
            local head, root_part, humanoid = find_first_child(character, "Head"), find_first_child(character, "HumanoidRootPart"), find_first_child_of_class(character, "Humanoid");
            if head and root_part and humanoid then
                return head, root_part, humanoid;
            end;
            return false;
        end;
    end;
    --
    library.get_health = function(plr)
        if library.overrides.get_health ~= nil then
            return library.overrides.get_health(plr);
        end;
        local character = library.get_character(plr);
        if character then
            local humanoid = find_first_child_of_class(character, "Humanoid");
            if humanoid then
                return math_floor(humanoid.Health), math_floor(humanoid.MaxHealth);
            end;
        end;
        return 100, 100;
    end;
    --
    library.get_weapon = function(plr)
        if library.overrides.get_weapon ~= nil then
            return library.overrides.get_weapon(plr);
        end;
        local character = library.get_character(plr);
        if character then
            local weapon = find_first_child_of_class(character, "Tool");
            if weapon then
                return weapon.Name;
            end;
        end;
        return "";
    end;
    -- 
    library.set_invisible = function(obj, include_arrow, include_tracer)
        set_render_property(obj.box, "Visible", false);
        set_render_property(obj.box_outline, "Visible", false);
        set_render_property(obj.healthbar, "Visible", false);
        set_render_property(obj.healthbar_outline, "Visible", false);
        set_render_property(obj.viewangle, "Visible", false);
        set_render_property(obj.name, "Visible", false);
        set_render_property(obj.distance, "Visible", false);
        set_render_property(obj.health, "Visible", false);
        set_render_property(obj.weapon, "Visible", false);
        set_render_property(obj.viewangle, "Visible", false);
        obj.chams.Enabled = false;

        if include_arrow then 
            set_render_property(obj.arrow, "Visible", false);
            set_render_property(obj.arrow_outline, "Visible", false);
            set_render_property(obj.arrow_box, "Visible", false);
            set_render_property(obj.arrow_box_outline, "Visible", false);
            set_render_property(obj.arrow_name, "Visible", false);
            set_render_property(obj.arrow_distance, "Visible", false);
            set_render_property(obj.arrow_health, "Visible", false);
            set_render_property(obj.arrow_weapon, "Visible", false);
            set_render_property(obj.arrow_healthbar, "Visible", false);
            set_render_property(obj.arrow_healthbar_outline, "Visible", false);
            set_render_property(obj.arrow_box, "Visible", false);
            set_render_property(obj.arrow_box_outline, "Visible", false);
        end;
        if include_tracer then 
            set_render_property(obj.snapline, "Visible", false);
            set_render_property(obj.snapline_outline, "Visible", false);
        end;
    end;
    --
    library.set_transparency = function(obj, include_arrow, trans)
        set_render_property(obj.box, "Transparency", trans);
        set_render_property(obj.box_outline, "Transparency", trans);
        set_render_property(obj.healthbar, "Transparency", trans);
        set_render_property(obj.healthbar_outline, "Transparency", trans);
        set_render_property(obj.viewangle, "Transparency", trans);
        set_render_property(obj.snapline, "Transparency", trans);
        set_render_property(obj.name, "Transparency", trans);
        set_render_property(obj.distance, "Transparency", trans);
        set_render_property(obj.health, "Transparency", trans);
        set_render_property(obj.weapon, "Transparency", trans);
        set_render_property(obj.viewangle, "Transparency", trans);

        if include_arrow then 
            set_render_property(obj.arrow, "Transparency", trans);
            set_render_property(obj.arrow_outline, "Transparency", trans);
            set_render_property(obj.arrow_box, "Transparency", trans);
            set_render_property(obj.arrow_box_outline, "Transparency", trans);
            set_render_property(obj.arrow_name, "Transparency", trans);
            set_render_property(obj.arrow_distance, "Transparency", trans);
            set_render_property(obj.arrow_health, "Transparency", trans);
            set_render_property(obj.arrow_weapon, "Transparency", trans);
            set_render_property(obj.arrow_healthbar, "Transparency", trans);
            set_render_property(obj.arrow_healthbar_outline, "Transparency", trans);
            set_render_property(obj.arrow_box, "Transparency", trans);
            set_render_property(obj.arrow_box_outline, "Transparency", trans);
            set_render_property(obj.snapline, "Transparency", trans);
            set_render_property(obj.snapline_outline, "Transparency", trans);
        end;
        if trans == 0 then 
            library.set_invisible(obj, include_arrow);
        end;
    end;
end;

-- // Connection functions
do
    library.esp = function(plr)
        if plr ~= localplayer then
            local data = {
                name = create_render_object("Text");
                distance = create_render_object("Text");
                health = create_render_object("Text");
                weapon = create_render_object("Text");
                box = create_render_object("Square");
                box_outline = create_render_object("Square");
                healthbar = create_render_object("Square");
                healthbar_outline = create_render_object("Square");
                arrow = create_render_object("Triangle");
                arrow_outline = create_render_object("Triangle");
                arrow_box = create_render_object("Square");
                arrow_box_outline = create_render_object("Square");
                arrow_name = create_render_object("Text");
                arrow_distance = create_render_object("Text");
                arrow_health = create_render_object("Text");
                arrow_weapon = create_render_object("Text");
                arrow_healthbar = create_render_object("Square");
                arrow_healthbar_outline = create_render_object("Square");
                arrow_box = create_render_object("Square");
                arrow_box_outline = create_render_object("Square");
                viewangle = create_render_object("Line");
                snapline = create_render_object("Line");
                snapline_outline = create_render_object("Line");
                chams = Instance.new("Highlight");
                corner = {};
                adorments = {};
                connection = nil;
            }; data.__index = data;

            data.connection = run_service.RenderStepped:Connect(function()
                local obj = data;
                local character = library.get_character(plr);
                local head, root_part, humanoid = library.get_parts(plr);
                local box = obj.box;
                local box_outline = obj.box_outline;
                local healthbar = obj.healthbar;
                local healthbar_outline = obj.healthbar_outline;
                local arrow_healthbar = obj.arrow_healthbar;
                local arrow_healthbar_outline = obj.arrow_healthbar_outline;
                local arrow_box = obj.arrow_box;
                local arrow_box_outline = obj.arrow_box_outline;
                local arrow = obj.arrow;
                local arrow_outline = obj.arrow_outline;
                local name = obj.name;
                local distance = obj.distance;
                local health = obj.health;
                local weapon = obj.weapon;
                local arrow_name = obj.arrow_name;
                local arrow_distance = obj.arrow_distance;
                local arrow_health = obj.arrow_health;
                local arrow_weapon = obj.arrow_weapon;
                local viewangle = obj.viewangle;
                local snapline = obj.snapline;
                local snapline_outline = obj.snapline_outline;
                local corner = obj.corner;
                local chams = obj.chams;
                local adorments = obj.adorments;
        
                if head and library.settings.enabled then 
                    on_screen = false;
                    is_visible = library.check_visible(head);
                    local bodyPartsList = library.getBodyParts(character);
        
                    local current_health, max_health = library.get_health(plr);
                    local current_weapon = library.get_weapon(plr);
                    local stud_conversion = math_floor((root_part.CFrame.p - camera.CFrame.p).magnitude);
                    local meter_conversion = math_floor(stud_conversion / 3.5714285714);   
                    local current_conversion = math_floor(meter_conversion * library.settings.measurements[library.settings.conversion][2]);
        
                    -- OLD CHAMS
                    for i, v in pairs(bodyPartsList) do 
                        if library.settings.chams.enabled and library.settings.chams.type == "Adornment" and table_find(bodyParts, v.Name) and not adorments[v] then 
                            if not v:IsA("Folder") and v.ClassName ~= "Model" and v.Name ~= "HumanoidRootPart" and v.Name ~= "HeadCollider" and v.Name ~= "Humanoid" and v:IsA("BasePart")  then 
                                local chams = {};
                                for i2 = 1, 2 do 
                                    local adornment;
                                    if v.Name == "Head"  then 
                                        local wrap = find_first_child_of_class(v, "WrapTarget")
                                        adornment = Instance.new("CylinderHandleAdornment", v)
                                        adornment.Height = v.Size.y + 0.3
                                        adornment.Radius = v.Size.X * (wrap and 0.45 or 0.275) + 0.2
        
                                        adornment.CFrame = new_cframe(new_vector3(0, 0, 0), new_vector3(0, 1, 0))
                                        if i2 == 1 then 
                                            adornment.Radius -= 0.2
                                            adornment.Height -= 0.2
                                            adornment.Transparency -= 0.1
                                        end;
                                    else 
                                        adornment = Instance.new("BoxHandleAdornment", v);
                                        adornment.Size = v.Size + new_vector3(0.2, 0.2, 0.2);
                                        if i2 == 1 then
                                            adornment.Size -= new_vector3(0.25, 0.25, 0.25)
                                        end;
                                    end;
                                    --
                                    adornment.Name = i2 == 1 and "cms" or "cmso";
                                    adornment.Adornee = v;
                                    adornment.ZIndex = i2 == 1 and 2 or 1;
                                    adornment.AlwaysOnTop = i2 == 1;
                                    chams[i2] = adornment;
                                end;
                                adorments[v] = chams;
                            end;
                        end;
        
                        if adorments[v] then 
                            if library.settings.enabled and library.settings.chams.enabled and library.settings.chams.type == "Adornment" and library.settings.max_distance > current_conversion then 
                                if table_find(library.checks, "Team") and localplayer.Team == plr.Team then 
                                    adorments[v][1].Visible = false;
                                    adorments[v][2].Visible = false;
                                    continue;
                                end;
                                if table_find(library.checks, "Invisible") and head.Transparency == 1 then 
                                    adorments[v][1].Visible = false;
                                    adorments[v][2].Visible = false;
                                    continue;
                                end;
                                if table_find(library.checks, "Health") and current_health < 0.9 then 
                                    adorments[v][1].Visible = false;
                                    adorments[v][2].Visible = false;
                                    continue;
                                end;
                                if table_find(library.checks, "Friendly") and localplayer:IsFriendsWith(plr.UserId) then 
                                    adorments[v][1].Visible = false;
                                    adorments[v][2].Visible = false;
                                    continue;
                                end;
        
                                adorments[v][1].Color3 = is_visible and library.settings.chams.color or library.settings.chams.in_vis_color;
                                adorments[v][1].Transparency = library.settings.chams.transparency
                                adorments[v][1].Visible = library.settings.chams.enabled;
                                adorments[v][2].Color3 = library.settings.chams.outline_color
                                adorments[v][2].Transparency = library.settings.chams.outline_transparency
                                adorments[v][2].Visible = library.settings.chams.enabled;
        
                                if library.settings.chams.pulse then 
                                    adorments[v][1].Transparency = (math_sin(tick() * 5) + 1) / 2
                                else
                                    adorments[v][1].Transparency = library.settings.chams.transparency
                                end;
                            else
                                adorments[v][1].Visible = false;
                                adorments[v][2].Visible = false;
                            end;
                        end;
                    end;

                    if library.checks["Team"] and localplayer.Team == plr.Team then library.set_invisible(obj, true, true); return; end;
                    if library.checks["Invisible"] and head.Transparency == 1 then library.set_invisible(obj, true, true); return; end;
                    if table_find(library.checks, "Health") and current_health < 0.9 then library.set_invisible(obj, true, true); return; end;
                    if table_find(library.checks, "Friendly") and localplayer:IsFriendsWith(plr.UserId) then library.set_invisible(obj, true, true); return; end;
        
                    if library.settings.max_distance > current_conversion then
                        if library.settings.box.type == "Dynamic" then 
                            local calculations = library.get_bounding_box(root_part);
                            local y_minimal, y_maximal = camera.ViewportSize.y, 0;
                            local x_minimal, x_maximal = camera.ViewportSize.x, 0;
                    
                            for _, cf in pairs(calculations) do
                                local vector, os = world_to_view_port(camera, cf.Position)
                                on_screen = os;
                                local x, y = vector.X, vector.Y
                                if x < x_minimal then x_minimal = x; end;
                                if x > x_maximal then x_maximal = x; end;
                                if y < y_minimal then y_minimal = y; end;
                                if y > y_maximal then y_maximal = y; end;
                            end;
        
                            -- // Offsets
                            local top_offset = 3;
                            local bottom_offset = y_maximal + 1;
                            local left_offset_x, left_offset_y = 0, 0;
                            local right_offset_x, right_offset_y = 0, 0;
                            
                            -- // Bounding Box
                            local box_size = library.round(new_vector2(x_minimal - x_maximal, y_minimal - y_maximal));
                            local box_position = library.round(new_vector2(x_maximal + box_size.X / x_minimal, y_maximal + box_size.Y / y_minimal));
                            set_render_property(box, "Visible", library.settings.box.enabled);
                            set_render_property(box_outline, "Visible", library.settings.box.enabled);
                            if get_render_property(box, "Visible") then
                                set_render_property(box, "Visible", library.settings.box.enabled);
                                set_render_property(box, "Size", box_size);
                                set_render_property(box, "Position", box_position);
                                set_render_property(box, "Filled", false);
                                set_render_property(box, "Thickness", 1);
                                set_render_property(box, "Color", library.settings.box.color);
                                set_render_property(box, "ZIndex", 2);
                                --
                                set_render_property(box_outline, "Visible", library.settings.box.enabled);
                                set_render_property(box_outline, "Size", box_size);
                                set_render_property(box_outline, "Position", box_position);
                                set_render_property(box_outline, "Filled", false);
                                set_render_property(box_outline, "Thickness", 3);
                                set_render_property(box_outline, "Color", library.settings.box.outline_color);
                                set_render_property(box_outline, "ZIndex", 1);
                            end;
        
                            -- // Health Bar
                            set_render_property(healthbar, "Visible", library.settings.healthbar.enabled);
                            set_render_property(healthbar_outline, "Visible", library.settings.healthbar.enabled);
                            if get_render_property(healthbar, "Visible") then 
                                if library.settings.healthbar.position == "Left" then 
                                    set_render_property(healthbar_outline, "Size", new_vector2(3, box_size.Y - 4));
                                    set_render_property(healthbar_outline, "Position", new_vector2(x_maximal + box_size.X - 6, box_position.Y + 2));
                                    -- 
                                    set_render_property(healthbar, "Size", new_vector2(1, (current_health * get_render_property(healthbar_outline, "Size").Y / max_health) + 2));
                                    set_render_property(healthbar, "Position", get_render_property(healthbar_outline, "Position") + new_vector2(1, -1 + -(get_render_property(healthbar, "Size").Y - get_render_property(healthbar, "Size").Y)));
                                    left_offset_x = left_offset_x + 4
                                elseif library.settings.healthbar.position == "Right" then 
                                    set_render_property(healthbar_outline, "Size", new_vector2(3, box_size.Y - 4));
                                    set_render_property(healthbar_outline, "Position", new_vector2(x_maximal + box_size.X + 3, box_position.Y + 2) - new_vector2(box_size.X, 0));
                                    --
                                    set_render_property(healthbar, "Size", new_vector2(1, (current_health * get_render_property(healthbar_outline, "Size").Y / max_health) + 2));
                                    set_render_property(healthbar, "Position", new_vector2(x_maximal + box_size.X + 4, box_position.Y + 1) - new_vector2(box_size.X, 0));
                                    right_offset_x = right_offset_x + 4
                                elseif library.settings.healthbar.position == "Top" then 
                                    set_render_property(healthbar_outline, "Size", new_vector2(box_size.X - 4, 3));
                                    set_render_property(healthbar_outline, "Position", box_position + new_vector2(2, box_size.Y - 6));
                                    -- 
                                    set_render_property(healthbar, "Size", new_vector2((current_health * get_render_property(healthbar_outline, "Size").X / max_health) + 2, 1));
                                    set_render_property(healthbar, "Position", get_render_property(healthbar_outline, "Position") + new_vector2(1 + -(get_render_property(healthbar, "Size").X - get_render_property(healthbar_outline, "Size").X),1));
                                    top_offset = top_offset + 6;
                                elseif library.settings.healthbar.position == "Bottom" then 
                                    set_render_property(healthbar_outline, "Size", new_vector2(box_size.X - 4, 3));
                                    set_render_property(healthbar_outline, "Position", box_position + new_vector2(2, box_size.Y - 6) - new_vector2(0, box_size.Y - 9));
                                    -- 
                                    set_render_property(healthbar, "Size", new_vector2((current_health * get_render_property(healthbar_outline, "Size").X / max_health) + 2, 1));
                                    set_render_property(healthbar, "Position", get_render_property(healthbar_outline, "Position") + new_vector2(1 + -(get_render_property(healthbar, "Size").X - get_render_property(healthbar_outline, "Size").X),1));
                                    bottom_offset = bottom_offset + 6;
                                end;
                                --
                                set_render_property(healthbar, "Filled", true);
                                set_render_property(healthbar, "Thickness", 1);
                                set_render_property(healthbar, "ZIndex", 2);
                                set_render_property(healthbar, "Color", library.settings.healthbar.empty:Lerp(library.settings.healthbar.color, current_health / max_health));
                                --
                                set_render_property(healthbar_outline, "Color", library.settings.healthbar.outline_color);
                                set_render_property(healthbar_outline, "Filled", true);
                                set_render_property(healthbar_outline, "Thickness", 3);
                                set_render_property(healthbar_outline, "ZIndex", 1);
                            end;
        
                            -- Name
                            set_render_property(name, "Visible", library.settings.name.enabled);
                            do
                                if library.settings.name.position == "Top" then 
                                    set_render_property(name, "Position", new_vector2(x_maximal + box_size.X / 2, box_position.Y) - new_vector2(0, get_render_property(name, "TextBounds").Y - box_size.Y + top_offset));
                                    set_render_property(name, "Center", true);  
                                    top_offset = top_offset + 10;
                                elseif library.settings.name.position == "Bottom" then
                                    set_render_property(name, "Position", new_vector2(box_size.X / 2 + box_position.X, bottom_offset));
                                    set_render_property(name, "Center", true);  
                                    bottom_offset = bottom_offset + 10;
                                elseif library.settings.name.position == "Left" then
                                    set_render_property(name, "Position", new_vector2(x_maximal + box_size.X - 6, box_position.Y + 2) - new_vector2(get_render_property(name, "TextBounds").X - 2 + left_offset_x, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - left_offset_y));
                                    set_render_property(name, "Center", false);                                 
                                    left_offset_y = left_offset_y + 10;
                                elseif library.settings.name.position == "Right" then
                                    if library.settings.healthbar.position == "Right" then -- fucking retarded, yes i know
                                        set_render_property(name, "Position", new_vector2(x_maximal + box_size.X + 3 + get_render_property(name, "TextBounds").X / 100 + right_offset_x, box_position.Y + 2) - new_vector2(box_size.X, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - right_offset_y));
                                    else
                                        set_render_property(name, "Position", new_vector2(x_maximal + box_size.X + 3 + get_render_property(name, "TextBounds").X / 100 - right_offset_x, box_position.Y + 2) - new_vector2(box_size.X, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - right_offset_y));
                                    end;
                                    set_render_property(name, "Center", false);                                 
                                    left_offset_y = left_offset_y + 10;
                                end;
                                set_render_property(name, "Size", library.settings.font_size);
                                set_render_property(name, "Font", Drawing.Fonts[library.settings.font]);
                                set_render_property(name, "Text", library.surround_string(library.settings.use_display_name and plr.DisplayName or plr.Name, library.settings.name.surround));
                                set_render_property(name, "Color", library.settings.name.color);        
                                set_render_property(name, "OutlineColor", library.settings.name.outline_color);              
                                set_render_property(name, "Outline", true)
                            end;
        
                            -- Distance
                            set_render_property(distance, "Visible", library.settings.distance.enabled);
                            do
                                if library.settings.distance.position == "Top" then 
                                    set_render_property(distance, "Position", new_vector2(x_maximal + box_size.X / 2, box_position.Y) - new_vector2(0, get_render_property(distance, "TextBounds").Y - box_size.Y + top_offset));
                                    set_render_property(distance, "Center", true);  
                                    top_offset = top_offset + 10;
                                elseif library.settings.distance.position == "Bottom" then
                                    set_render_property(distance, "Position", new_vector2(box_size.X / 2 + box_position.X, bottom_offset));
                                    set_render_property(distance, "Center", true);  
                                    bottom_offset = bottom_offset + 10;
                                elseif library.settings.distance.position == "Left" then
                                    set_render_property(distance, "Position", new_vector2(x_maximal + box_size.X - 6, box_position.Y + 2) - new_vector2(get_render_property(distance, "TextBounds").X - 2 + left_offset_x, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - left_offset_y));
                                    set_render_property(distance, "Center", false);                                 
                                    left_offset_y = left_offset_y + 10;
                                elseif library.settings.distance.position == "Right" then
                                    if library.settings.healthbar.position == "Right" then -- fucking retarded, yes i know
                                        set_render_property(distance, "Position", new_vector2(x_maximal + box_size.X + 3 + get_render_property(distance, "TextBounds").X / 100 + right_offset_x, box_position.Y + 2) - new_vector2(box_size.X, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - right_offset_y));
                                    else
                                        set_render_property(distance, "Position", new_vector2(x_maximal + box_size.X + 3 + get_render_property(distance, "TextBounds").X / 100 - right_offset_x, box_position.Y + 2) - new_vector2(box_size.X, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - right_offset_y));
                                    end;
                                    set_render_property(distance, "Center", false);                                 
                                    left_offset_y = left_offset_y + 10;
                                end;
                                set_render_property(distance, "Text", library.surround_string(("%s%s"):format(tostring(current_conversion), library.settings.measurements[library.settings.conversion][1]), library.settings.distance.surround))
                                set_render_property(distance, "Size", library.settings.font_size);
                                set_render_property(distance, "Font", Drawing.Fonts[library.settings.font]);
                                set_render_property(distance, "Color", library.settings.distance.color);        
                                set_render_property(distance, "OutlineColor", library.settings.distance.outline_color);              
                                set_render_property(distance, "Outline", true);           
                            end;
        
                            -- Weapon
                            set_render_property(weapon, "Visible", library.settings.weapon.enabled);
                            do
                                if library.settings.weapon.position == "Top" then 
                                    set_render_property(weapon, "Position", new_vector2(x_maximal + box_size.X / 2, box_position.Y) - new_vector2(0, get_render_property(weapon, "TextBounds").Y - box_size.Y + top_offset));
                                    set_render_property(weapon, "Center", true);  
                                    top_offset = top_offset + 10;
                                elseif library.settings.weapon.position == "Bottom" then
                                    set_render_property(weapon, "Position", new_vector2(box_size.X / 2 + box_position.X, bottom_offset));
                                    set_render_property(weapon, "Center", true);  
                                    bottom_offset = bottom_offset + 10;
                                elseif library.settings.weapon.position == "Left" then
                                    set_render_property(weapon, "Position", new_vector2(x_maximal + box_size.X - 6, box_position.Y + 2) - new_vector2(get_render_property(weapon, "TextBounds").X - 2 + left_offset_x, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - left_offset_y));
                                    set_render_property(weapon, "Center", false);                                 
                                    left_offset_y = left_offset_y + 10;
                                elseif library.settings.weapon.position == "Right" then
                                    if library.settings.healthbar.position == "Right" then -- fucking retarded, yes i know
                                        set_render_property(weapon, "Position", new_vector2(x_maximal + box_size.X + 3 + get_render_property(weapon, "TextBounds").X / 100 + right_offset_x, box_position.Y + 2) - new_vector2(box_size.X, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - right_offset_y));
                                    else
                                        set_render_property(weapon, "Position", new_vector2(x_maximal + box_size.X + 3 + get_render_property(weapon, "TextBounds").X / 100 - right_offset_x, box_position.Y + 2) - new_vector2(box_size.X, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - right_offset_y));
                                    end;
                                    set_render_property(weapon, "Center", false);                                 
                                    left_offset_y = left_offset_y + 10;
                                end;
                                set_render_property(weapon, "Text", library.surround_string(current_weapon, library.settings.weapon.surround)); 
                                set_render_property(weapon, "Size", library.settings.font_size);
                                set_render_property(weapon, "Font", Drawing.Fonts[library.settings.font]);
                                set_render_property(weapon, "Color", library.settings.weapon.color);        
                                set_render_property(weapon, "OutlineColor", library.settings.weapon.outline_color);              
                                set_render_property(weapon, "Outline", true);         
                            end;
        
                            -- Health
                            set_render_property(health, "Visible", library.settings.health.enabled);
                            if library.settings.health.more_data then 
                                set_render_property(health, "Text", library.surround_string(("%s/%s"):format(tostring(current_health), tostring(max_health)), library.settings.health.surround)) 
                            else 
                                set_render_property(health, "Text", library.surround_string(("%s"):format(tostring(current_health)), library.settings.health.surround)); 
                            end;
                            do
                                if library.settings.health.position == "Top" then 
                                    set_render_property(health, "Position", new_vector2(x_maximal + box_size.X / 2, box_position.Y) - new_vector2(0, get_render_property(health, "TextBounds").Y - box_size.Y + top_offset));
                                    set_render_property(health, "Center", true);  
                                    top_offset = top_offset + 10;
                                elseif library.settings.health.position == "Bottom" then
                                    set_render_property(health, "Position", new_vector2(box_size.X / 2 + box_position.X, bottom_offset));
                                    set_render_property(health, "Center", true);  
                                    bottom_offset = bottom_offset + 10;
                                elseif library.settings.health.position == "Left" then
                                    set_render_property(health, "Position", new_vector2(x_maximal + box_size.X - 6, box_position.Y + 2) - new_vector2(get_render_property(health, "TextBounds").X - 2 + left_offset_x, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - left_offset_y));
                                    set_render_property(health, "Center", false);                                 
                                    left_offset_y = left_offset_y + 10;
                                elseif library.settings.health.position == "Right" then
                                    if library.settings.healthbar.position == "Right" then -- fucking retarded, yes i know
                                        set_render_property(health, "Position", new_vector2(x_maximal + box_size.X + 3 + get_render_property(health, "TextBounds").X / 100 + right_offset_x, box_position.Y + 2) - new_vector2(box_size.X, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - right_offset_y));
                                    else
                                        set_render_property(health, "Position", new_vector2(x_maximal + box_size.X + 3 + get_render_property(health, "TextBounds").X / 100 - right_offset_x, box_position.Y + 2) - new_vector2(box_size.X, -(100 * new_vector2(3, box_size.Y - 4).Y / 100) + 2 - right_offset_y));
                                    end;
                                    set_render_property(health, "Center", false);                                 
                                    left_offset_y = left_offset_y + 10;
                                elseif library.settings.health.position == "Bar" then
                                    if current_health < 99.9 then 
                                        set_render_property(health, "Visible", true);
                                    else
                                        set_render_property(health, "Visible", false);
                                    end;
                                    set_render_property(health, "Position", get_render_property(healthbar, "Position"));
                                    set_render_property(health, "Center", true);                                 
                                end;
                                set_render_property(health, "Size", library.settings.font_size);
                                set_render_property(health, "Font", Drawing.Fonts[library.settings.font]);
                                set_render_property(health, "OutlineColor", library.settings.health.outline_color);              
                                set_render_property(health, "Outline", true);       
                                if library.settings.health.auto_color then set_render_property(health, "Color", get_render_property(healthbar, "Color")); else set_render_property(health, "Color", library.settings.health.color); end;
                            end; 
                        else 
                            local hrp_position, oss = world_to_view_port(camera, root_part.Position);
                            local screen_position = world_to_view_port(camera, root_part.Position - Vector3.zero)
                            local scale_factor = 1 / (hrp_position.Z * math_tan(math_rad(camera.FieldOfView / 2)) * 2) * 1000;
                            local width, height = 4 * scale_factor, 6.5 * scale_factor
        
                            width *= camera.ViewportSize.X / 1920
                            height *= camera.ViewportSize.Y / 1080
        
                            local vector_2 = library.to_vector(hrp_position);
                            local x, y = math_round(vector_2.x), math_round(vector_2.y);
                            on_screen = oss;
        
                            -- // Offsets
                            local top_offset = 5;
                            local bottom_offset = 0;
                            local left_offset_x, left_offset_y = 0, 0;
                            local right_offset_x, right_offset_y = 0, 0;
        
                            -- // Bounding Box
                            local box_size = library.round(new_vector2(math.max(width, 6), math.max(height, 10)));
                            local box_position = library.round(new_vector2(screen_position.X - width / 2, screen_position.Y - height / 2));
        
                            set_render_property(box, "Visible", library.settings.box.style == "Square" and library.settings.box.enabled or false);
                            set_render_property(box_outline, "Visible", library.settings.box.style == "Square" and library.settings.box.enabled or false);
                            if get_render_property(box, "Visible") then
                                set_render_property(box, "Visible", library.settings.box.enabled);
                                set_render_property(box, "Size", box_size);
                                set_render_property(box, "Position", box_position);
                                set_render_property(box, "Filled", false);
                                set_render_property(box, "Thickness", 1);
                                set_render_property(box, "Color", library.settings.box.color);
                                set_render_property(box, "ZIndex", 2);
                                --
                                set_render_property(box_outline, "Visible", library.settings.box.enabled);
                                set_render_property(box_outline, "Size", box_size);
                                set_render_property(box_outline, "Position", box_position);
                                set_render_property(box_outline, "Filled", false);
                                set_render_property(box_outline, "Thickness", 3);
                                set_render_property(box_outline, "Color", library.settings.box.outline_color);
                                set_render_property(box_outline, "ZIndex", 1);
                            end;
        
                            -- // Healthbar
                            set_render_property(healthbar, "Visible", library.settings.healthbar.enabled);
                            set_render_property(healthbar_outline, "Visible", library.settings.healthbar.enabled);
                            if get_render_property(healthbar, "Visible") then 
                                if library.settings.healthbar.position == "Left" then 
                                    set_render_property(healthbar_outline, "Size", new_vector2(3, box_size.Y + 2));
                                    set_render_property(healthbar_outline, "Position", box_position + new_vector2(-5, -1));
                                    -- 
                                    set_render_property(healthbar, "Size", new_vector2(1, -((get_render_property(healthbar_outline, "Size").Y - 2) * (current_health / max_health))));
                                    set_render_property(healthbar, "Position", get_render_property(healthbar_outline, "Position") + new_vector2(1, -1 + get_render_property(healthbar_outline, "Size").Y));
                                    left_offset_x = left_offset_x + 4;
                                elseif library.settings.healthbar.position == "Right" then
                                    set_render_property(healthbar_outline, "Size", new_vector2(3, box_size.Y + 2));
                                    set_render_property(healthbar_outline, "Position", box_position + new_vector2(box_size.X + 2, -1));
                                    -- 
                                    set_render_property(healthbar, "Size", new_vector2(1, -((get_render_property(healthbar_outline, "Size").Y - 2) * (current_health / max_health))));
                                    set_render_property(healthbar, "Position", get_render_property(healthbar_outline, "Position") + new_vector2(1, -1 + get_render_property(healthbar_outline, "Size").Y));
                                    right_offset_x = right_offset_x + 4;
                                elseif library.settings.healthbar.position == "Top" then
                                    set_render_property(healthbar_outline, "Size", new_vector2(box_size.X + 2, 3));
                                    set_render_property(healthbar_outline, "Position", box_position + new_vector2(-1, -5));
                                    -- 
                                    set_render_property(healthbar, "Size", new_vector2(((get_render_property(healthbar_outline, "Size").X - 2) * (current_health / max_health)), 1));
                                    set_render_property(healthbar, "Position", get_render_property(healthbar_outline, "Position") + new_vector2(1, 1));
                                    top_offset = top_offset + 4;
                                elseif library.settings.healthbar.position == "Bottom" then
                                    set_render_property(healthbar_outline, "Size", new_vector2(box_size.X + 2, 3));
                                    set_render_property(healthbar_outline, "Position", box_position + new_vector2(-1, box_size.Y + 2));
                                    -- 
                                    set_render_property(healthbar, "Size", new_vector2(((get_render_property(healthbar_outline, "Size").X - 2) * (current_health / max_health)), 1));
                                    set_render_property(healthbar, "Position", get_render_property(healthbar_outline, "Position") + new_vector2(1, 1));
                                    bottom_offset = bottom_offset + 4;
                                end;
                                --
                                set_render_property(healthbar, "Filled", true);
                                set_render_property(healthbar, "Thickness", 1);
                                set_render_property(healthbar, "ZIndex", 2);
                                set_render_property(healthbar, "Color", library.settings.healthbar.empty:Lerp(library.settings.healthbar.color, current_health / max_health));
                                --
                                set_render_property(healthbar_outline, "Color", library.settings.healthbar.outline_color);
                                set_render_property(healthbar_outline, "Filled", true);
                                set_render_property(healthbar_outline, "Thickness", 3);
                                set_render_property(healthbar_outline, "ZIndex", 1);
                            end;
        
                            -- // Name
                            set_render_property(name, "Visible", library.settings.name.enabled);
                            do
                                if library.settings.name.position == "Top" then
                                    set_render_property(name, "Position", box_position + new_vector2(width / 2, -top_offset - 10));
                                    top_offset = top_offset + 10;
                                    set_render_property(name, "Center", true);    
                                elseif library.settings.name.position == "Bottom" then
                                    set_render_property(name, "Position", box_position + new_vector2(width / 2, box_size.Y + bottom_offset + 2));
                                    bottom_offset = bottom_offset + 10;
                                    set_render_property(name, "Center", true);    
                                elseif library.settings.name.position == "Left" then
                                    set_render_property(name, "Position", box_position + new_vector2(-get_render_property(name, "TextBounds").X/2 - 2 - left_offset_x, -2 + left_offset_y));
                                    set_render_property(name, "Center", true);    
                                    left_offset_x = left_offset_x + 10;
                                elseif library.settings.name.position == "Right" then
                                    set_render_property(name, "Position", box_position + new_vector2(width + get_render_property(name, "TextBounds").X / 2 + 2 + right_offset_x, -2 + right_offset_y));
                                    right_offset_x = right_offset_x + 10;
                                    set_render_property(name, "Center", false);    
                                end;
                                set_render_property(name, "Size", library.settings.font_size);
                                set_render_property(name, "Font", Drawing.Fonts[library.settings.font]);
                                set_render_property(name, "Text", library.settings.use_display_name and plr.DisplayName or plr.Name);
                                set_render_property(name, "Color", library.settings.name.color);        
                                set_render_property(name, "OutlineColor", library.settings.name.outline_color);              
                                set_render_property(name, "Outline", true);       
                            end;
        
                            -- // Distance
                            set_render_property(distance, "Visible", library.settings.distance.enabled);
                            do
                                if library.settings.distance.position == "Top" then
                                    set_render_property(distance, "Position", box_position + new_vector2(width / 2, -top_offset - 10));
                                    top_offset = top_offset + 10;
                                    set_render_property(distance, "Center", true);    
                                elseif library.settings.distance.position == "Bottom" then
                                    set_render_property(distance, "Position", box_position + new_vector2(width / 2, box_size.Y + bottom_offset + 2));
                                    bottom_offset = bottom_offset + 10;
                                    set_render_property(distance, "Center", true);    
                                elseif library.settings.distance.position == "Left" then
                                    set_render_property(distance, "Position", box_position + new_vector2(-get_render_property(distance, "TextBounds").X/2 - 2 - left_offset_x, -2 + left_offset_y));
                                    set_render_property(distance, "Center", true);    
                                    left_offset_x = left_offset_x + 10;
                                elseif library.settings.distance.position == "Right" then
                                    set_render_property(distance, "Position", box_position + new_vector2(width + get_render_property(distance, "TextBounds").X / 2 + 2 + right_offset_x, -2 + right_offset_y));
                                    right_offset_x = right_offset_x + 10;
                                    set_render_property(distance, "Center", false);    
                                end;
                                set_render_property(distance, "Size", library.settings.font_size);
                                set_render_property(distance, "Font", Drawing.Fonts[library.settings.font]);
                                set_render_property(distance, "Text", ("%s%s"):format(tostring(current_conversion), library.settings.measurements[library.settings.conversion][1]))
                                set_render_property(distance, "Color", library.settings.distance.color);        
                                set_render_property(distance, "OutlineColor", library.settings.distance.outline_color);              
                                set_render_property(distance, "Outline", true);       
                            end;
        
                            -- // Weapon
                            set_render_property(weapon, "Visible", library.settings.weapon.enabled);
                            do
                                if library.settings.weapon.position == "Top" then
                                    set_render_property(weapon, "Position", box_position + new_vector2(width / 2, -top_offset - 10));
                                    top_offset = top_offset + 10;
                                    set_render_property(weapon, "Center", true);    
                                elseif library.settings.weapon.position == "Bottom" then
                                    set_render_property(weapon, "Position", box_position + new_vector2(width / 2, box_size.Y + bottom_offset + 2));
                                    bottom_offset = bottom_offset + 10;
                                    set_render_property(weapon, "Center", true);    
                                elseif library.settings.weapon.position == "Left" then
                                    set_render_property(weapon, "Position", box_position + new_vector2(-get_render_property(weapon, "TextBounds").X/2 - 2 - left_offset_x, -2 + left_offset_y));
                                    set_render_property(weapon, "Center", true);    
                                    left_offset_x = left_offset_x + 10;
                                elseif library.settings.weapon.position == "Right" then
                                    set_render_property(weapon, "Position", box_position + new_vector2(width + get_render_property(weapon, "TextBounds").X / 2 + 2 + right_offset_x, -2 + right_offset_y));
                                    right_offset_x = right_offset_x + 10;
                                    set_render_property(weapon, "Center", false);    
                                end;
                                set_render_property(weapon, "Size", library.settings.font_size);
                                set_render_property(weapon, "Font", Drawing.Fonts[library.settings.font]);
                                set_render_property(weapon, "Text", library.surround_string(current_weapon, library.settings.weapon.surround)); 
                                set_render_property(weapon, "Color", library.settings.weapon.color);        
                                set_render_property(weapon, "OutlineColor", library.settings.weapon.outline_color);              
                                set_render_property(weapon, "Outline", true);       
                            end;
        
                            -- // Health
                            set_render_property(health, "Visible", library.settings.health.enabled);
                            if library.settings.health.more_data then set_render_property(health, "Text", ("%s/%s"):format(tostring(current_health), tostring(max_health))) else 
                                set_render_property(health, "Text", ("%s"):format(tostring(current_health))); 
                            end;
                            do
                                if library.settings.health.position == "Top" then
                                    set_render_property(health, "Position", box_position + new_vector2(width / 2, -top_offset - 10));
                                    top_offset = top_offset + 10;
                                    set_render_property(health, "Center", true);    
                                elseif library.settings.health.position == "Bottom" then
                                    set_render_property(health, "Position", box_position + new_vector2(width / 2, box_size.Y + bottom_offset + 2));
                                    bottom_offset = bottom_offset + 10;
                                    set_render_property(health, "Center", true);    
                                elseif library.settings.health.position == "Left" then
                                    set_render_property(health, "Position", box_position + new_vector2(-get_render_property(health, "TextBounds").X/2 - 2 - left_offset_x, -2 + left_offset_y));
                                    set_render_property(health, "Center", true);    
                                    left_offset_x = left_offset_x + 10;
                                elseif library.settings.health.position == "Right" then
                                    set_render_property(health, "Position", box_position + new_vector2(width + get_render_property(health, "TextBounds").X / 2 + 2 + right_offset_x, -2 + right_offset_y));
                                    right_offset_x = right_offset_x + 10;
                                    set_render_property(health, "Center", false);    
                                end;
                                set_render_property(health, "Size", library.settings.font_size);
                                set_render_property(health, "Font", Drawing.Fonts[library.settings.font]);
                                set_render_property(health, "OutlineColor", library.settings.health.outline_color);              
                                set_render_property(health, "Outline", true);       
                                if library.settings.health.auto_color then set_render_property(health, "Color", library.settings.healthbar.empty:Lerp(library.settings.healthbar.color, current_health / max_health)); else set_render_property(health, "Color", library.settings.health.color); end;
                            end;
                        end;
        
                        -- // Offscreen Arrow
                        set_render_property(arrow, "Visible", library.settings.offscreen_arrow.enabled and not on_screen);
                        set_render_property(arrow_outline, "Visible", library.settings.offscreen_arrow.enabled and not on_screen);
                        if get_render_property(arrow, "Visible") then
                            local proj = point_to_object_space(camera.CFrame, root_part.Position);
                            local angle = math_atan2(proj.Z, proj.X);
                            local direction = new_vector2(math_cos(angle), math_sin(angle));
                            local position = camera.ViewportSize / 2 + direction * library.settings.offscreen_arrow.radius;
        
                            -- // Points
                            local point_a = position; 
                            local point_b = position - library.rotate_vector(direction, 27) * library.settings.offscreen_arrow.size; 
                            local point_c = position - library.rotate_vector(direction, -27) * library.settings.offscreen_arrow.size;
                            local point_d = new_vector2((point_a.X + point_b.X + point_c.X) / 3, (point_a.Y + point_b.Y + point_c.Y) / 3);
        
                            local box_size = new_vector2(library.settings.offscreen_arrow.size, library.settings.offscreen_arrow.size);
                            local box_position = (point_d - new_vector2(library.settings.offscreen_arrow.size / 2, library.settings.offscreen_arrow.size / 2)); 
        
                            -- // Arrow
                            set_render_property(arrow, "PointA", point_a);
                            set_render_property(arrow, "PointB", point_b);
                            set_render_property(arrow, "PointC", point_c);
                            set_render_property(arrow, "Color", library.settings.offscreen_arrow.color);
                            set_render_property(arrow, "Color", is_visible and library.settings.offscreen_arrow.color or library.settings.offscreen_arrow.invis_color);
                            set_render_property(arrow, "Filled", true);
                            set_render_property(arrow, "Thickness", 1);
                            set_render_property(arrow, "ZIndex", 2);
                            -- 
                            set_render_property(arrow_outline, "PointA", point_a);
                            set_render_property(arrow_outline, "PointB", point_b);
                            set_render_property(arrow_outline, "PointC", point_c);
                            set_render_property(arrow_outline, "Color", library.settings.offscreen_arrow.outline_color);
                            set_render_property(arrow_outline, "Filled", false);
                            set_render_property(arrow_outline, "Thickness", 4);
                            set_render_property(arrow_outline, "ZIndex", 1);
        
                            -- Indicators
                            do  
                                bottom_indi_offset = -3;
        
                                -- Name Indicator
                                do
                                    set_render_property(arrow_name, "Visible", table_find(library.settings.offscreen_arrow.indicators, "Name") and not on_screen);
                                    if get_render_property(arrow_name, "Visible") then
                                        set_render_property(arrow_name, "Position", box_position + new_vector2(box_size.X / 2, -(13+4)));
                                        set_render_property(arrow_name, "Text", library.surround_string(library.settings.use_display_name and plr.DisplayName or plr.Name, library.settings.name.surround));
                                        set_render_property(arrow_name, "Size", library.settings.font_size);
                                        set_render_property(arrow_name, "Font", Drawing.Fonts[library.settings.font]);
                                        set_render_property(arrow_name, "Color", library.settings.name.color);
                                        set_render_property(arrow_name, "Outline", true);
                                        set_render_property(arrow_name, "Center", true);
                                    end;
                                end;
        
                                -- Distance Indicator
                                do
                                    set_render_property(arrow_distance, "Visible", table_find(library.settings.offscreen_arrow.indicators, "Distance") and not on_screen);
                                    if get_render_property(arrow_distance, "Visible") then
                                        set_render_property(arrow_distance, "Position", box_position + new_vector2(box_size.X / 2, box_size.Y-(bottom_indi_offset)));
                                        set_render_property(arrow_distance, "Text", library.surround_string(("%s%s"):format(tostring(current_conversion), library.settings.measurements[library.settings.conversion][1]), library.settings.distance.surround))
                                        set_render_property(arrow_distance, "Size", library.settings.font_size);
                                        set_render_property(arrow_distance, "Font", Drawing.Fonts[library.settings.font]);
                                        set_render_property(arrow_distance, "Color", library.settings.distance.color);
                                        set_render_property(arrow_distance, "Outline", true);
                                        set_render_property(arrow_distance, "Center", true);
                                    end;
                                    bottom_indi_offset = bottom_indi_offset - 10;
                                end;
        
                                -- Weapon Indicator
                                do
                                    set_render_property(arrow_weapon, "Visible", table_find(library.settings.offscreen_arrow.indicators, "Weapon") and not on_screen);
                                    if get_render_property(arrow_weapon, "Visible") then
                                        set_render_property(arrow_weapon, "Position", box_position + new_vector2(box_size.X / 2, box_size.Y-(bottom_indi_offset)));
                                        set_render_property(arrow_weapon, "Text", library.surround_string(current_weapon, library.settings.weapon.surround)); 
                                        set_render_property(arrow_weapon, "Size", library.settings.font_size);
                                        set_render_property(arrow_weapon, "Font", Drawing.Fonts[library.settings.font]);
                                        set_render_property(arrow_weapon, "Color", library.settings.weapon.color);
                                        set_render_property(arrow_weapon, "Outline", true);
                                        set_render_property(arrow_weapon, "Center", true);
                                    end;
                                    bottom_indi_offset = bottom_indi_offset - 10;
                                end;
        
                                -- Health Indicator
                                do
                                    set_render_property(arrow_healthbar, "Visible", table_find(library.settings.offscreen_arrow.indicators, "Healthbar") and not on_screen);
                                    set_render_property(arrow_healthbar_outline, "Visible", table_find(library.settings.offscreen_arrow.indicators, "Healthbar") and not on_screen);
                                    if get_render_property(arrow_healthbar, "Visible") then
                                        set_render_property(arrow_healthbar_outline, "Position", library.round(new_vector2(box_position.X - 6, box_position.Y + 2)));
                                        set_render_property(arrow_healthbar_outline, "Size", library.round(new_vector2(3, box_size.Y * (100 / 100) + 2)));
                                        set_render_property(arrow_healthbar_outline, "Color", color_new());
                                        set_render_property(arrow_healthbar_outline, "Visible", true);
                                        set_render_property(arrow_healthbar_outline, "Thickness", 3);
                                        set_render_property(arrow_healthbar_outline, "ZIndex", 1);
                                        set_render_property(arrow_healthbar_outline, "Filled", true);
                                        
                                        set_render_property(arrow_healthbar, "Position",library.round(new_vector2(box_position.X - 5, box_position.Y + 3)));
                                        set_render_property(arrow_healthbar, "Size", library.round(new_vector2(1, box_size.Y * (current_health / max_health))));
                                        set_render_property(arrow_healthbar, "Color", library.settings.healthbar.empty:Lerp(library.settings.healthbar.color, current_health / max_health));
                                        set_render_property(arrow_healthbar, "Visible", true);
                                        set_render_property(arrow_healthbar, "Thickness", 1);
                                        set_render_property(arrow_healthbar, "ZIndex", 2);
                                        set_render_property(arrow_healthbar, "Filled", true);
                                    end;
                                end;
                            end;
                        else
                            set_render_property(arrow_box, "Visible", false);
                            set_render_property(arrow_name, "Visible", false);
                            set_render_property(arrow_distance, "Visible", false);
                            set_render_property(arrow_weapon, "Visible", false);
                            set_render_property(arrow_healthbar, "Visible", false);
                            set_render_property(arrow_healthbar_outline, "Visible", false);
                        end;
        
                        -- // Viewangle
                        set_render_property(viewangle, "Visible", library.settings.viewangle.enabled);
                        if get_render_property(viewangle, "Visible") then
                            local from_head = world_to_view_port(camera, character.Head.CFrame.p);
                            local to_point = world_to_view_port(camera, (character.Head.CFrame + (character.Head.CFrame.lookVector * 5)).p);
        
                            set_render_property(viewangle, "From", from_head);
                            set_render_property(viewangle, "To", to_point);
                            set_render_property(viewangle, "Color", library.settings.viewangle.color);
                        end;
        
                        -- // Chams
                        if chams.Adornee ~= library.settings.chams.enabled or chams.Adornee ~= library.settings.chams.type == "Highlight" then
                            chams.Adornee = character;
                            chams.Parent = game.CoreGui;
                        end;
                        if library.settings.chams.enabled and library.settings.chams.type == "Highlight" then
                            chams.Enabled = library.settings.chams.enabled;
                            chams.FillColor = is_visible and library.settings.chams.color or library.settings.chams.in_vis_color;
                            chams.OutlineColor = library.settings.chams.outline_color;
                            chams.FillTransparency = library.settings.chams.transparency;
                            chams.OutlineTransparency = library.settings.chams.outline_transparency;
        
                            if library.settings.chams.pulse then 
                                chams.FillTransparency = (math_sin(tick() * 5) + 1) / 2
                            else
                                chams.FillTransparency = library.settings.chams.transparency
                            end;
                        else 
                            chams.Enabled = false;
                        end;
        
                        if not on_screen then 
                            library.set_invisible(obj, false, false, false); 
                            return;
                        end;
                    else
                        library.set_invisible(obj, true, true); 
                        return;
                    end;  
                else
                    library.set_invisible(obj, true, true); 
                    return;
                end;
            end);

            library.cache[plr] = data;
        end;
    end;
    -- 
    local whitelist = { "chams", "adornments", "connection" }
    library.remove = function(plr)
        if library.cache[plr] then
            for i,v in next, library.cache[plr] do
                if table.find(whitelist, i) then
                    if i == "adornments" then
                        for i,v in next, v do
                            v:Destroy();
                        end
                    elseif i == "chams" then
                        v:Destroy()
                    elseif i == "connection" then
                        v:Disconnect()
                    end
                else
                    if typeof(v) ~= "table" then
                        destroy_render_object(v);
                    end
                end;
            end;
            library.cache[plr] = nil;
        end;
    end;
    --
    library.getBodyParts = function(char) -- most retarded shit ever
        local partList = {};
        if find_first_child(char, "Head") then 
            partList[#partList + 1] = char["Head"]
        end;
        if find_first_child(char, "Left Arm") then 
            partList[#partList + 1] = char["Left Arm"]
        end;
        if find_first_child(char, "Right Arm") then 
            partList[#partList + 1] = char["Right Arm"]
        end;
        if find_first_child(char, "Left Leg") then 
            partList[#partList + 1] = char["Left Leg"]
        end;
        if find_first_child(char, "Right Leg") then 
            partList[#partList + 1] = char["Right Leg"]
        end;
        if find_first_child(char, "Torso") then 
            partList[#partList + 1] = char["Torso"]
        end;
        if find_first_child(char, "LeftUpperArm") then 
            partList[#partList + 1] = char["LeftUpperArm"]
        end;
        if find_first_child(char, "LeftLowerArm") then 
            partList[#partList + 1] = char["LeftLowerArm"]
        end;
        if find_first_child(char, "LeftHand") then 
            partList[#partList + 1] = char["LeftHand"]
        end;
        if find_first_child(char, "RightUpperArm") then 
            partList[#partList + 1] = char["RightUpperArm"]
        end;
        if find_first_child(char, "RightLowerArm") then 
            partList[#partList + 1] = char["RightLowerArm"]
        end;
        if find_first_child(char, "RightHand") then 
            partList[#partList + 1] = char["RightHand"]
        end;
        if find_first_child(char, "LeftUpperLeg") then 
            partList[#partList + 1] = char["LeftUpperLeg"]
        end;
        if find_first_child(char, "LeftLowerLeg") then 
            partList[#partList + 1] = char["LeftLowerLeg"]
        end;
        if find_first_child(char, "LeftFoot") then 
            partList[#partList + 1] = char["LeftFoot"]
        end;
        if find_first_child(char, "RightUpperLeg") then 
            partList[#partList + 1] = char["RightUpperLeg"]
        end;
        if find_first_child(char, "RightLowerLeg") then 
            partList[#partList + 1] = char["RightLowerLeg"]
        end;
        if find_first_child(char, "RightFoot") then 
            partList[#partList + 1] = char["RightFoot"]
        end;
        if find_first_child(char, "UpperTorso") then 
            partList[#partList + 1] = char["UpperTorso"]
        end;
        if find_first_child(char, "LowerTorso") then 
            partList[#partList + 1] = char["LowerTorso"]
        end;
        return partList;
    end;
end;

for i,v in pairs(get_players(players)) do library.esp(v) end;
players.PlayerAdded:Connect(library.esp);
players.PlayerRemoving:Connect(library.remove);

return library;