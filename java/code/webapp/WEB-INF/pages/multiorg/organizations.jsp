<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://rhn.redhat.com/rhn" prefix="rhn" %>
<%@ taglib uri="http://rhn.redhat.com/tags/list" prefix="rl" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>

<html>
<body>

<html:errors />
<html:messages id="message" message="true">
  <rhn:messages><c:out escapeXml="false" value="${message}" /></rhn:messages>
</html:messages>

<html:errors />
<c:set var="pageList" value="${requestScope.pageList}" />

<rhn:toolbar base="h1" img="/img/rhn-icon-org.gif" >
  <bean:message key="organizations.jsp.toolbar"/>
</rhn:toolbar>

<h2><bean:message key="org.trust.header" arg0="${orgName}"/></h2>

<div>
<rl:listset name="orgListSet">
<!-- Start of org list -->
<rl:list dataset="pageList"
         width="100%"
         name="orgList"         
         styleclass="list"      
         filter="com.redhat.rhn.frontend.action.multiorg.OrgListFilter"   
         emptykey="orglist.jsp.noOrgs">
        
	<!-- Organization name column -->		
	<rl:column bound="false" 
	           sortable="true" 
	           styleclass="first-column"
	           headerkey="org.nopunc.displayname"
	           sortattr="name"> 
		<c:out value="<a href=\"/rhn/admin/multiorg/OrgDetails.do?oid=${current.id}\">${current.name}</a>" escapeXml="false" />
		<c:if test="${current.id == 1}">*</c:if>
	</rl:column>
	<rl:column bound="false" 
	           sortable="false" 
	           headerkey="org.nopunc.sharedchannels" 	           
	           attr="sharedChannels">
	    <c:choose>
	    <c:when test="${current.sharedChannels > 0}">	    
		  <c:out value="<a href=\"\">${current.sharedChannels}</a>" escapeXml="false" />
		</c:when>
		<c:otherwise>
		  <c:out value="${current.sharedChannels}" /> 
		</c:otherwise>
		</c:choose>
	</rl:column>	
</rl:list>

</rl:listset>
</div>

</body>
</html>

