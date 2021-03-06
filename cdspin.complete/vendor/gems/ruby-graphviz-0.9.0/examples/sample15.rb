#!/usr/bin/ruby

# fdp example 
# see : http://www.graphviz.org/Gallery/undirected/fdpclust.html

$:.unshift( "../lib" );
require "graphviz"

GraphViz::new( "G", :type => "graph", :output => "png", :use => "fdp" ) { |graph|
  graph.e
  graph.clusterA { |cA|
    cA.a << cA.b
    cA.clusterC { |cC|
      cC._c( :label => "C" ) << cC._d( :label => "D" )
    }
  }
  graph.clusterB { |cB|
    cB.d << cB.f
  }
  graph.clusterB.d << graph.clusterA.clusterC._d
  graph.e << graph.clusterB
  graph.clusterA.clusterC << graph.clusterB
}.output( :path => '/usr/local/bin/', :file => "#{$0}.png" )