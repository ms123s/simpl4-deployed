/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: JspC/ApacheTomcat8
 * Generated at: 2015-05-28 19:00:05 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class slave_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!--\n  Licensed to the Apache Software Foundation (ASF) under one or more\n  contributor license agreements.  See the NOTICE file distributed with\n  this work for additional information regarding copyright ownership.\n  The ASF licenses this file to You under the Apache License, Version 2.0\n  (the \"License\"); you may not use this file except in compliance with\n  the License.  You may obtain a copy of the License at\n\n  http://www.apache.org/licenses/LICENSE-2.0\n\n  Unless required by applicable law or agreed to in writing, software\n  distributed under the License is distributed on an \"AS IS\" BASIS,\n  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n  See the License for the specific language governing permissions and\n  limitations under the License.\n-->\n\n\n\n\n\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n\n<html xmlns='http://www.w3.org/1999/xhtml'>\n<head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\n");
      out.write("    <title>Apache ActiveMQ</title>\n    <style type=\"text/css\" media=\"screen\">\n        @import url('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/styles/type-settings.css');\n        @import url('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/styles/site.css');\n    </style>\n\n\n\n</head>\n\n<body>\n\n\n<div class=\"white_box\">\n    <div class=\"header\">\n        <div class=\"header_l\">\n            <div class=\"header_r\">\n            </div>\n        </div>\n    </div>\n    <div class=\"content\">\n        <div class=\"content_l\">\n            <div class=\"content_r\">\n\n                <div>\n\n                    <!-- Banner -->\n                    <div id=\"asf_logo\">\n                        <div id=\"activemq_logo\">\n                            <a style=\"float:left; width:280px;display:block;text-indent:-5000px;text-decoration:none;line-height:60px; margin-top:10px; margin-left:100px;\"\n                               href=\"http://activemq.apache.org/\"\n                               title=\"The most popular and powerful open source Message Broker\">ActiveMQ</a>\n                            <a style=\"float:right; width:210px;display:block;text-indent:-5000px;text-decoration:none;line-height:60px; margin-top:15px; margin-right:10px;\"\n                               href=\"http://www.apache.org/\" title=\"The Apache Software Foundation\">ASF</a>\n");
      out.write("                        </div>\n                    </div>\n\n\n                    <div class=\"top_red_bar\">\n                        <div id=\"site-breadcrumbs\">\n                        </div>\n                        <div id=\"site-quicklinks\"><p>\n                            <a href=\"http://activemq.apache.org/support.html\"\n                               title=\"Get help and support using Apache ActiveMQ\">Support</a></p>\n                        </div>\n                    </div>\n\n                    <table border=\"0\">\n                        <tbody>\n                            <tr>\n                                <td valign=\"top\" width=\"100%\" style=\"overflow:hidden;\">\n                                    <div class=\"body-content\">\n                                        <p align=\"center\">Broker is currently in <b>slave</b> mode!</p>\n                                    </div>\n                                </td>\n                                <td valign=\"top\">\n\n                                    <div class=\"navigation\">\n");
      out.write("                                        <div class=\"navigation_top\">\n                                            <div class=\"navigation_bottom\">\n                                                <h3>Useful Links</h3>\n\n                                                <ul class=\"alternate\" type=\"square\">\n                                                    <li><a href=\"http://activemq.apache.org/\"\n                                                           title=\"The most popular and powerful open source Message Broker\">Documentation</a></li>\n                                                    <li><a href=\"http://activemq.apache.org/faq.html\">FAQ</a></li>\n                                                    <li><a href=\"http://activemq.apache.org/download.html\">Downloads</a>\n                                                    </li>\n                                                    <li><a href=\"http://activemq.apache.org/discussion-forums.html\">Forums</a>\n                                                    </li>\n                                                </ul>\n");
      out.write("                                            </div>\n                                        </div>\n                                    </div>\n                                </td>\n                            </tr>\n                        </tbody>\n                    </table>\n\n\n                    <div class=\"bottom_red_bar\"></div>\n                </div>\n            </div>\n        </div>\n    </div>\n    <div class=\"black_box\">\n        <div class=\"footer\">\n            <div class=\"footer_l\">\n                <div class=\"footer_r\">\n                    <div>\n                        Copyright 2005-2013 The Apache Software Foundation.\n\n                        (<a href=\"?printable=true\">printable version</a>)\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>\n<div class=\"design_attribution\"><a href=\"http://hiramchirino.com/\">Graphic Design By Hiram</a></div>\n\n</body>\n</html>");
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
