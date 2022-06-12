function createTooltip(screenPosition)
  for widgetName, label in pairs(compactLabels) do
    if widget.inMember(widgetName, screenPosition) then
      local tooltip = config.getParameter("tooltipLayout")
      sb.logInfo(sb.printJson(tooltip))
      
      tooltip.text.value = label
      if not tooltip.text.value or #tooltip.text.value == 0 then return end
      
      -- , yeah
      local text = string.gsub(tooltip.text.value, "(^.-;)", "") --remove colors
      local _,smalls = string.gsub(text, "[il.,:;'| ]", "") --small characters . i guess
      local _,m = string.gsub(text, "[MmWw]", "") --m
      local size = math.max(tooltip.background.size[1], math.ceil((#text + (m * 1.4) - (smalls * 0.6)) * 7.1))
      
      tooltip.background.size[1] = size
      tooltip.text.position[1] = size / 2
      tooltip.bg.fileBody = tooltip.bg.fileBody.."?scale="..size..";1"
      
      return tooltip
    end
  end
end