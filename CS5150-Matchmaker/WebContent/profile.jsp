<jsp:include page="header.jsp">
	<jsp:param name="stud_or_prof" value="stud" />
	<jsp:param name="sidebar_type" value="stud-profile" />
	<jsp:param name="sidebar_selected" value="view" />
	<jsp:param name="top_selected" value="profile" />
</jsp:include>
<%@page
	import="java.util.*,model.*, org.json.JSONObject,javax.persistence.*"%>

<%	 EntityManagerFactory emf = Persistence.createEntityManagerFactory("test");
	 EntityManager em = emf.createEntityManager();
	 Student s = StudentController.getStudentByNetID(em,"lr437"); 
	 String[] attributes = {"Email", "Major", "Minor", "Year", "College", "GPA", "Skills", "Research Interests"};
	 
     /* These JSON objects store all possible values */
	 JSONObject jsonMajor = ListController.getItemJson(em,ItemFactory.MAJOR);
     JSONObject jsonMinor = ListController.getItemJson(em,ItemFactory.MINOR);
     JSONObject jsonCollege = ListController.getItemJson(em,ItemFactory.COLLEGE);
     JSONObject jsonSkills = ListController.getItemJson(em,ItemFactory.SKILL);
     JSONObject jsonInterest = ListController.getItemJson(em,ItemFactory.INTEREST);

     /* These JSON objects store values specific to the given student */
     JSONObject jsonStudMajor = s.getObjectJson(s.getMajors());
     JSONObject jsonStudMinor = s.getObjectJson(s.getMinors());
     JSONObject jsonStudCollege = s.getObjectJson(s.getColleges());;
     JSONObject jsonStudSkills = s.getObjectJson(s.getSkills());
     JSONObject jsonStudInterest = s.getObjectJson(s.getInterests());;
%>
<script type="text/javascript">
         var majorData = <%= jsonMajor %>;
         var minorData = <%= jsonMinor %>;
         var collegeData = <%= jsonCollege %>;
         var skillsData = <%= jsonSkills %>;
         var interestData = <%= jsonInterest %>;
         
         var prefillMajor = <%= jsonStudMajor %>;
         var prefillMinor = <%= jsonStudMinor %>;
         var prefillCollege = <%= jsonStudCollege %>;
         var prefillSkills = <%= jsonStudSkills %>;
         var prefillInterests = <%= jsonStudInterest %>;
</script>

<div class="content">
	<h1>My Profile</h1>
	<div class="photo-info clearfix">
		<img class="avatar" src="images/avatar-male.jpg" alt="avatar" />
		<form name="profile" action="savechanges.jsp" method="GET">
			<table class="info">
				<tr>
					<td><h2><%=s.getName() %></h2></td>
					<td></td>
				</tr>
				<% for(String attr: attributes){ %>
				<tr>
					<td><%=attr %>:</td>
					<td class="field">
						<p class="read-only <%= s.getAttribute(attr) == "" ? "hidden" : "" %>">
							<%=s.getAttribute(attr) %>
							<a class="edit-btn" href="#"> <img
								src="images/pencil_small.png" alt="edit" />
							</a>
						</p>
						<p class="editable <%= s.getAttribute(attr) != "" ? "hidden" : "" %>">
							<% if(attr.equals("Year")){ %>
								<select name = "year">
									<option value="">---</option>
								<% String year_val = s.getAttribute(attr); %>
								<% for(int i = 1; i<=5; i++){ 
									String i_str = Integer.toString(i);
									if(i == 5){
										i_str += "+";
									}
									if(year_val.equals(i_str)){ %>
										<option value="<%= i %>" selected="selected"><%= i_str%></option>
									<%	} else{ %>
										<option value="<%= i %>"><%= i_str%></option>
									<% } %>
								<% } %>
							</select>
							<% } else{ %>
							<input name="<%=attr.replaceAll(" ", "_").toLowerCase() %>"
								value="<%=s.getAttribute(attr) %>" type="text" />
							<% } %>
						</p>
						<p class="other hidden">
							<input name="<%=attr.replaceAll(" ", "_").toLowerCase()+"_other" %>" type="text" />
						</p>
					</td>
				</tr>
				<% } %>
			</table>
			<input type="submit" value="Save Changes" />
		</form>

	</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>
