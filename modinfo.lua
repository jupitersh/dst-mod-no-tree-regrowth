name = "No Tree Regrowth"

description = "Disable any kinds of tree respawning."

author = "辣椒小皇纸"

icon_atlas = "modicon.xml"
icon = "modicon.tex"

version = "1.1"

forumthread = ""

api_version = 10

dst_compatible = true

all_clients_require_mod = false
clients_only_mod = false

server_filter_tags = {"No Tree Regrowth"}

configuration_options =
{
	{
		name = "force_twiggytree_removal",
		label = "Force Twiggytree Removal",
		hover = "",
		options =	{
						{description = "Yes", data = true, hover = ""},
						{description = "No", data = false, hover = ""},
					},
		default = true,
	},
}