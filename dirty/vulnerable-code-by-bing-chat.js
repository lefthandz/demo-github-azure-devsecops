// DOM-based XSS
import javascript

from DataFlow::Node source, DataFlow::Node sink
where source = DOM::source()
  and sink = DOM::sink()
  and source.flowsTo(sink)
select sink, "This DOM write is vulnerable to XSS."

// RCE via eval
import javascript

from CallExpr call
where call.getCalleeName() = "eval"
select call, "This call to eval is potentially unsafe."

// Path manipulation via fs module
import javascript

from DataFlow::SourceNode source, DataFlow::Node sink, DataFlow::Edge edge
where source = RemoteFlowSource()
  and sink = ModuleImportNode::moduleImport("fs")
  and edge.getPath(source,sink).length() < 5 // limit path length for performance reasons
select edge.getNode(0), "This input may be used to manipulate paths in the file system."
