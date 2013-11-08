<jsp:include page="header.jsp">
    <jsp:param name="stud_or_prof" value="researcher"/>
    <jsp:param name="sidebar_type" value="researcher-students"/>
    <jsp:param name="sidebar_selected" value="invite"/>
    <jsp:param name="top_selected" value="students"/>
</jsp:include>
<%@page import="java.util.*,model.Student, model.StudentController"%>
					<div class="content">
						<h1>Students</h1>
						<table class="project-list">
							<thead>
								<tr>
									<th>Name</th>
									<th>GPA</th>
									<th>Major</th>
									<th>Year</th>
									<th>Skills</th>
									<th>Research Area</th>
								</tr>
							</thead>
							<tbody>
							<tr>
								<td><input type="text" name="filter-name"></td>
								<td>
									<select name="filter-gpa">
										<option value="gt4">&gt;4.0</option>
										<option value="35to4"><3.5-4.0</option>
										<option value="3to35">3.0-3.5</option>
										<option value="25to3">2.5-3.0</option>
										<option value="lt25">&lt;2.5</option>
									</select>
								</td>
								<td><input type="text" name="filter-major"></td>
								<td>
									<select name="filter-year">
										<option value="1">1st year</option>
										<option value="2">2nd year</option>
										<option value="3">3rd year</option>
										<option value="4">4th year</option>
										<option value="5+">5th year or greater</option>
									</select>
								</td>
								<td><input type="text" name="filter-skill"></td>
								<td><input type="text" name="filter-interest"></td>
							</tr>
						<%List<Student> studentList = StudentController.getAllStudents(); 
							for(Student s: studentList)
							{
							%>
								
									<tr>
										<td><%=s.getName() %></td>
										<td><%=s.getGpa() %></td>
										<td><%=s.getMajorString() %></td>
										<td><%=s.getYear() %></td>
										<td><%=s.getSkillString() %></td>
										<td><%=s.getInterestString() %></td>
									</tr>
							<% } %>
							</tbody>
						</table>
						<jsp:include page="pager.jsp"/>
					</div>				
				</div>
			</div>
		</div>
	</div>
</body>
</html>