/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: JspC/ApacheTomcat8
 * Generated at: 2015-05-28 19:00:05 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.decorators;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/jspf/headertags.jspf", Long.valueOf(1432836252000L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n\n\n\n\n");
      out.write("\n                                    </div>\n                                </td>\n                                <td valign=\"top\">\n\n                                    <div class=\"navigation\">\n                                        <div class=\"navigation_top\">\n                                            <div class=\"navigation_bottom\">\n                                                <H3>Queue Views</H3>\n\n                                                <ul class=\"alternate\" type=\"square\">\n\n\n\n                                                    <li><a href=\"queueGraph.jsp\" title=\"View the queue depths as a graph\">Graph</a></li>\n                                                    <li><a href=\"xml/queues.jsp\" title=\"View the queues as XML\">XML</a></li>\n                                                </ul>\n                                                <H3>Topic Views</H3>\n\n                                                <ul class=\"alternate\" type=\"square\">\n\n\n\n                                                    <li><a href=\"xml/topics.jsp\" title=\"View the topics as XML\">XML</a></li>\n");
      out.write("                                                </ul>\n                                                <H3>Subscribers Views</H3>\n\n                                                <ul class=\"alternate\" type=\"square\">\n\n\n\n                                                    <li><a href=\"xml/subscribers.jsp\" title=\"View the subscribers as XML\">XML</a></li>\n                                                </ul>\n                                                <H3>Useful Links</H3>\n\n                                                <ul class=\"alternate\" type=\"square\">\n                                                    <li><a href=\"http://activemq.apache.org/\"\n                                                           title=\"The most popular and powerful open source Message Broker\">Documentation</a></li>\n                                                    <li><a href=\"http://activemq.apache.org/faq.html\">FAQ</a></li>\n                                                    <li><a href=\"http://activemq.apache.org/download.html\">Downloads</a>\n");
      out.write("                                                    </li>\n                                                    <li><a href=\"http://activemq.apache.org/discussion-forums.html\">Forums</a>\n                                                    </li>\n                                                </ul>\n                                            </div>\n                                        </div>\n                                    </div>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n\n\n                    <div class=\"bottom_red_bar\"></div>\n                </div>\n            </div>\n        </div>\n    </div>\n    <div class=\"black_box\">\n        <div class=\"footer\">\n            <div class=\"footer_l\">\n                <div class=\"footer_r\">\n                    <div>\n                        Copyright 2005-2014 The Apache Software Foundation.\n\n                        <!--  (<a href=\"?printable=true\">printable version</a>)-->\n                    </div>\n");
      out.write("                </div>\n            </div>\n        </div>\n    </div>\n</div>\n\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
