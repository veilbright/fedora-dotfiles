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
local function lnumfunc(args)
	-- if args.sclnu and segment.sign and segment.sign.wins[args.win].signs[args.lnum] then
	-- 	return "%=" .. M.signfunc(args, segment)
	-- end
	if not args.rnu and not args.nu then
		return ""
	end
	if args.virtnum ~= 0 then
		return "%="
	end

	local lnum = args.rnu and (args.relnum > 0 and args.relnum or (args.nu and args.lnum or 0)) or args.lnum

	-- For quickfix and loclist
	if vim.fn.getqflist({ winid = 0 }).winid ~= 0 or vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 then
		return "%=" .. lnum

		-- For normal files
	else
		-- Current line
		if args.relnum == 0 then
			return lnum .. "%="

			-- Other lines
		elseif lnum > 0 and lnum <= #line_numbers then
			return "%=" .. line_numbers[lnum]
		end
	end

	return ""
end

--- Return fold column in configured format.
local function foldfunc(args)
	local width = args.fold.width
	if width == 0 then
		return ""
	end

	local foldinfo = require("statuscol.ffidef").C.fold_info(args.wp, args.lnum)
	-- local string = args.cul and args.relnum == 0 and "%#CursorLineFold#" or "%#FoldColumn#"
	local string = ""
	local level = foldinfo.level

	if level == 0 then
		return string .. (" "):rep(width) .. "%*"
	end

	local closed = foldinfo.lines > 0
	local first_level = level - width - (closed and 1 or 0) + 1
	if first_level < 1 then
		first_level = 1
	end

	-- For each column, add a foldopen, foldclosed, foldsep or padding char
	local range = level < width and level or width
	for col = 1, range do
		if args.virtnum ~= 0 then
			string = string .. args.fold.sep
		elseif closed and (col == level or col == width) then
			string = "%#FoldClosed#" .. args.fold.close
		elseif foldinfo.start == args.lnum and first_level + col > foldinfo.llevel then
			string = string .. args.fold.open
		else
			string = string .. args.fold.sep
		end
	end
	if range < width then
		string = string .. (" "):rep(width - range)
	end

	return string .. "%*"
end

return {
	"luukvbaal/statuscol.nvim",
	cond = not vim.g.vscode,
	config = function()
		-- local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			segments = {
				{
					text = { foldfunc },
					click = "v:lua.ScFa",
				},
				{
					sign = {
						name = { ".*" },
						text = { ".*" },
						namespace = { ".*" },
						auto = true,
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
					fillchar = " ",
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
