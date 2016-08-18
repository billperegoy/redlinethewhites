# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Region.delete_all
Trail.delete_all
TrailSegment.delete_all
SegmentConnector.delete_all

region = Region.create(name: "Mt. Washington and the Southern Ridges")
trail = Trail.create(name: "Huntington Ravine Trail", region_id: region.id)
segment = TrailSegment.create(start: "Tuckerman Ravine Trail", end: "Raymond Path", distance: 0.5, trail_id: trail.id)
segment = TrailSegment.create(start: "Raymond Path", end: "first aid cache in ravine floor", distance: 1.2, trail_id: trail.id)
segment = TrailSegment.create(start: "first aid cache in ravine floor", end: "Alpine Garden Trail crossing", distance: 2.1, trail_id: trail.id)
segment = TrailSegment.create(start: "Alpine Garden Trail crossing", end: "Auto Rd.", distance: 2.4, trail_id: trail.id)


trail = Trail.create(name: "Nelson Crag Trail", region_id: region.id)
segment = TrailSegment.create(start: "Old Jackson Rd.", end: "closest approach to auto road near Cragway Spring", distance: 1.7, trail_id: trail.id)
segment = TrailSegment.create(start: "closest approach to auto road near Cragway Spring", end: "Huntington Ravine Trail", distance: 2.8, trail_id: trail.id)
segment = TrailSegment.create(start: "Huntington Ravine Trail", end: "Mt. Washington summit", distance: 3.6, trail_id: trail.id)


region = Region.create(name: "The Northern Peaks and the Great Gulf")
trail = Trail.create(name: "Six Husbands Trail", region_id: region.id)
segment = TrailSegment.create(start: "Great Gulf Trail", end: "Buttress Trail", distance: 0.5, trail_id: trail.id)
segment = TrailSegment.create(start: "Buttress Trail", end: "Edmands Col Cutoff", distance: 1.7, trail_id: trail.id)
segment = TrailSegment.create(start: "Edmands Col Cutoff", end: "Gulfside Trail", distance: 2.0, trail_id: trail.id)
saved = segment
segment = TrailSegment.create(start: "Gulfside Trail", end: "Mt. Jefferson Loop", distance: 2.3, trail_id: trail.id)

trail = Trail.create(name: "Buttress Trail", region_id: region.id)
segment = TrailSegment.create(start: "Six HusbandsTrail", end: "Star Lake Trail", distance: 1.9, trail_id: trail.id)

SegmentConnector.create(user_id: 2, trail_segment_id: segment.id)
SegmentConnector.create(user_id: 1, trail_segment_id: segment.id)
SegmentConnector.create(user_id: 1, trail_segment_id: saved.id)
