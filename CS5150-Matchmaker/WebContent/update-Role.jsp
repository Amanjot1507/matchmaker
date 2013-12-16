<%--
	This page allows you to update the roles of other users by Administrator.
 --%>
<jsp:include page="header.jsp">
	<jsp:param name="stud_or_prof" value="admin" />
	<jsp:param name="sidebar_type" value="stud-profile" />
	<jsp:param name="sidebar_selected" value="view" />
	<jsp:param name="top_selected" value="profile" />
</jsp:include>
<%@
	page import="java.util.*,model.Student, model.*, org.json.JSONObject,javax.persistence.*"
%>
<%
 	EntityManagerFactory emf = Persistence.createEntityManagerFactory("test");
    EntityManager em = emf.createEntityManager();
 	
    String netID = (String) session.getAttribute("currentUser");
 	Student student = StudentController.getStudentByNetID(em, netID);
 	Researcher researcher = ResearcherController.getResearcherByNetID(em, netID);
 	User user = UserController.findUser(em, netID);
 	
 	Boolean isStudent = (student != null);
 	Boolean isResearcher = (researcher != null);
 	Boolean isAdmin = (user != null && user.isAdmin());
 	
 	String searchDisplay = "";
 	
 	if(!isStudent && request.getParameter("studentRole") != null){ // Add a student role
		Student stud = StudentController.createStudent(em, user.getName(), user.getNetid(), 0.0, user.getEmail(),  null, null, null, null, null, null, null, null, user);
		searchDisplay += "<br>New Student role has been added for the user.";
 	}
 	
 	if(isStudent && request.getParameter("studentRole") == null){   // Remove a student role
 		if(student != null){
 			StudentController.removeStudent(em, student);
 			searchDisplay += "<br>Student profile has been removed for the user.";
 		}
 	}
 	
 	if(!isResearcher && request.getParameter("researcherRole") != null){ // Add a researcher role
	 	List<Interest> area = null;
   	 	Researcher researcherPL = ResearcherController.createResearcher(em, user.getName(), user.getNetid(), user.getEmail(), null, "", area, user);
   		searchDisplay += "<br>New Researcher role has been added for the user.";
 	}
 	
 	if(isResearcher && request.getParameter("researcherRole") == null){   // Remove a researcher role
 		if(researcher != null){
 			ResearcherController.deleteResearcher(em, researcher);
 			searchDisplay += "<br>Researcher profile has been removed for the user";
 		}
 	}
 	if(!isAdmin && request.getParameter("adminRole") != null){ // Add an admin role
 		if(user!= null){
 			UserController.setAdmin(em, user, true);
 			searchDisplay += "<br>New Administrator role has been added for the user.";
 		}
 	}
 	
 	if(isAdmin && request.getParameter("adminRole") == null){   // Remove an admin role
 		if(user!= null){
 			if(session.getAttribute("adminUser")!= null && 
 					user.getNetid().equalsIgnoreCase((String)session.getAttribute("adminUser"))){
 				searchDisplay += "<br>Cannot Remove your own Administrator profile";
 			}
 			else{
 				UserController.setAdmin(em, user, false);
 				searchDisplay += "<br>Administrator rights are revoked for the user.";
 				if(request.getParameter("studentRole") == null 
 			  	   && request.getParameter("researcherRole") == null){
 					UserController.deleteUser(em, user);		
 				}
 			}
 		}
 	}
 	
 	response.sendRedirect("admin-searchUser.jsp?searchDisplay="+searchDisplay+"&netID="+request.getParameter("userNetID")+"&name="+request.getParameter("userName"));
%>
</body>
</html>