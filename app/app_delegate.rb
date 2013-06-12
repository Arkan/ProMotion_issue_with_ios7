class SettingsScreen < PM::GroupedTableScreen
  title "Settings"
  searchable
  refreshable

  def on_load
    set_nav_bar_right_button("Save", action: :save)
    set_tab_bar_item(title: "Settings", icon: "settings.png")
  end

  # table_data is automatically called. Use this format in the return value.
  # It's an array of cell groups, each cell group consisting of a title and an array of cells.
  def table_data
    [{
      title: "Your Account",
      cells: (1..100).map{|i| { title: "Tat #{i}" } }
    }]
  end

  # This method allows you to create a "jumplist", the index on the right side of the table
  def table_data_index
    # Ruby magic to make an alphabetical array of letters.
    # Try this in Objective-C and tell me you want to go back.
    return ("A".."Z").to_a
  end

  # Your table cells, when tapped, will execute the corresponding actions
  # and pass in the specified arguments.
  def edit_profile(args={})
    puts args[:id] # => 3
  end
end

class AppDelegate < PM::Delegate
  def on_load(app, options)
    open SettingsScreen.new(nav_bar: true, toolbar: true)
  end
end