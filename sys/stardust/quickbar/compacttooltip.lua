local oldtooltip = createTooltip
function createTooltip(screenPosition)
  for widgetName, label in pairs(compactLabels) do
    if widget.inMember(widgetName, screenPosition) then
      return label
    end
  end
  if oldtooltip then oldtooltip(screenPosition) end
end