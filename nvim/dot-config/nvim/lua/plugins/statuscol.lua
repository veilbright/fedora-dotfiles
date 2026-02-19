local line_numbers = {
	"1",
	"2",
	"3",
	"4",
	"5",
	"11",
	"12",
	"13",
	"14",
	"15",
	"21",
	"22",
	"23",
	"24",
	"25",
	"31",
	"32",
	"33",
	"34",
	"35",
	"41",
	"42",
	"43",
	"44",
	"45",
	"51",
	"52",
	"53",
	"54",
	"55",
	"56",
	"57",
	"58",
	"59",
	"60",
	"61",
	"62",
	"63",
	"64",
	"65",
	"66",
	"67",
	"68",
	"69",
	"70",
	"71",
	"72",
	"73",
	"74",
	"75",
	"76",
	"77",
	"78",
	"79",
	"80",
	"81",
	"82",
	"83",
	"84",
	"85",
	"86",
	"87",
	"88",
	"89",
	"90",
	"91",
	"92",
	"93",
	"94",
	"95",
	"96",
	"97",
	"98",
	"99",
}

--- Return line number in configured format.
local function lnumfunc(args, segment)
	if args.sclnu and segment.sign and segment.sign.wins[args.win].signs[args.lnum] then
		return "%=" .. M.signfunc(args, segment)
	end
	if not args.rnu and not args.nu then
		return ""
	end
	if args.virtnum ~= 0 then
		return "%="
	end

	local lnum = args.rnu and (args.relnum > 0 and args.relnum or (args.nu and args.lnum or 0)) or args.lnum
	local lnum_str = ""

	if lnum > 0 and lnum <= #line_numbers then
		lnum_str = line_numbers[lnum]
	end

	local pad = (" "):rep(args.nuw - #lnum_str)
	if args.relnum == 0 then
		return lnum .. pad .. "%="
	else
		return "%=" .. pad .. lnum_str
	end
end

return {
	"luukvbaal/statuscol.nvim",
	cond = not vim.g.vscode,
	config = function()
		-- local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			segments = {
				{ text = { "%C" }, click = "v:lua.ScFa" },
				{
					sign = {
						name = { ".*" },
						text = { ".*" },
						namespace = { ".*" },
						auto = "",
					},
					click = "v:lua.ScSa",
				},
				{
					text = { lnumfunc },
					click = "v:lua.ScLa",
				},
				{
					sign = {
						namespace = { "gitsigns" },
						maxwidth = 1,
						colwidth = 1,
					},
					click = "v:lua.ScSa",
				},
			},
		})

		local up_key = "k"
		local down_key = "j"
		for index, label in ipairs(line_numbers) do
			vim.keymap.set({ "n", "v", "o" }, label .. up_key, index .. "k", { noremap = true })
			vim.keymap.set({ "n", "v", "o" }, label .. down_key, index .. "j", { noremap = true })
		end
	end,
}
