<jsp:include page="header.jsp">
    <jsp:param name="stud_or_prof" value="stud"/>
    <jsp:param name="sidebar_type" value="stud-project"/>
    <jsp:param name="sidebar_selected" value="invitation"/>
    <jsp:param name="top_selected" value="project"/>
</jsp:include>
					<div class="content">
						<h1>Projects</h1>
						<table class="project-list">
							<thead>
								<tr>
									<th>Project Name</th>
									<th>Researcher Name</th>
									<th>Project URL</th>
									<th>Description</th>
									<th>Research Area</th>
									<th>Required Skills</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Project Name</td>
									<td>Andrew Myers</td>
									<td><a href="#">Link to Project Webpage</a></td>
									<td></td>
									<td>Programming Languages</td>
									<td>Java</td>
								</tr>
								<tr>
									<td>Project Name</td>
									<td>Tom Magrino</td>
									<td></td>
									<td>This is a description of Project 2.  This is a...</td>
									<td>Systems</td>
									<td>Python</td>
								</tr>
							</tbody>
						</table>
						
					</div>				
				</div>
			</div>
		</div>
	</div>
</body>
</html>