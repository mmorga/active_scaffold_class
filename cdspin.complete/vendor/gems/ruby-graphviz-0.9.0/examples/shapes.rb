#!/usr/bin/ruby

$:.unshift( "../lib" );
require "graphviz"

g = nil
if ARGV[0]
  g = GraphViz::new( "G", "output" => "png", "path" => ARGV[0] )
else
  g = GraphViz::new( "G", "output" => "png" )
end

g.node["shape"] = "ellipse"

[ "box", "polygon", "ellipse", "circle", "point", 
  "egg", "triangle", "plaintext", "diamond", "trapezium", 
  "parallelogram", "house", "pentagon", "hexagon", "septagon", "octagon", "doublecircle", 
  "doubleoctagon", "tripleoctagon", "invtriangle", "invtrapezium", "invhouse", 
  "Mdiamond", "Msquare", "Mcircle", "rect", "rectangle", "none", "note", "tab", "folder",
  "box3d", "component" ].each { |s|
  g.add_node( s, "shape" => s )
}

g.output( :file => "shapes.png")
