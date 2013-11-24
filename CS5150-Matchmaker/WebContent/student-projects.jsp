<jsp:include page="header.jsp">
    <jsp:param name="stud_or_prof" value="stud"/>
    <jsp:param name="sidebar_type" value="stud-project"/>
    <jsp:param name="sidebar_selected" value="current"/>
    <jsp:param name="top_selected" value="project"/>
</jsp:include>
<%@page import="java.util.*,model.Student, model.*, org.json.JSONObject,javax.persistence.*"%>
					<div class="content">
						<%
						EntityManagerFactory emf = Persistence.createEntityManagerFactory("test");
					 	EntityManager em = emf.createEntityManager();
					 	JSONObject jsonMajor = ListController.getItemJson(em,ItemFactory.MAJOR);
				        JSONObject jsonSkills = ListController.getItemJson(em,ItemFactory.SKILL);
				        JSONObject jsonInterest = ListController.getItemJson(em,ItemFactory.INTEREST);
				         %>
				        <script type="text/javascript">
				        	var majorData = <%= jsonMajor %>;
				        	var skillsData = <%= jsonSkills %>;
				        	var interestData = <%= jsonInterest %>;
				        </script>
						<h1>My Projects</h1>
						<form name="filter-list" id="filter-list">
							<table class="project-list">
									<jsp:include page="proj-filters.jsp"/>
									<tr>
										<td>
											<p>Accepted &nbsp; <a class="actionButton hide" href="#">Hide</a></p>
										</td>
										<td>Project Name</td>
										<td>Andrew Myers</td>
										<td><a href="#">Link to Project Webpage</a></td>
										<td></td>
										<td>Programming Languages</td>
										<td>Java</td>
									</tr>
									<tr>
										<td>
											<p>Rejected &nbsp; <a class="actionButton hide" href="#">Hide</a></p>
										</td>
										<td>Project Name</td>
										<td>Tom Magrino</td>
										<td></td>
										<td>This is a description of Project 2.  This is a...</td>
										<td>Systems</td>
										<td>Python</td>
									</tr>
									<tr>
										<td>
											<p>Pending &nbsp; <a class="actionButton hide" href="#">Hide</a></p>
										</td>
										<td>Project Name</td>
										<td>Tom Magrino</td>
										<td></td>
										<td>This is a description of Project 3.  This is a...</td>
										<td>Systems</td>
										<td>Python</td>
									</tr>
								</tbody>
							</table>
						</form>
						
						<h1>Search New Projects</h1>
						<form name="filter-list" id="filter-list">
							<div class="search-container">
								<input type="text" />
								<input type="submit" value="Filter"/>
							</div>
							<table class="project-list">
									<jsp:include page="proj-filters.jsp"/>
									<tr>
										<td>
											<p><a class="actionButton apply" href="#">Apply</a> &nbsp; <a class="actionButton hide" href="#">Hide</a></p>
										</td>
										<td>Project Name</td>
										<td>Andrew Myers</td>
										<td><a href="#">Link to Project Webpage</a></td>
										<td></td>
										<td>Programming Languages</td>
										<td>Java</td>
									</tr>
									<tr>
										<td>
											<p><a class="actionButton apply" href="#">Apply</a> &nbsp; <a class="actionButton hide" href="#">Hide</a></p>
										</td>
										<td>Project Name</td>
										<td>Tom Magrino</td>
										<td></td>
										<td>This is a description of Project 2.  This is a...</td>
										<td>Systems</td>
										<td>Python</td>
									</tr>
									<tr>
										<td>
											<p><a class="actionButton apply" href="#">Apply</a> &nbsp; <a class="actionButton hide" href="#">Hide</a></p>
										</td>
										<td>Project Name</td>
										<td>Tom Magrino</td>
										<td></td>
										<td>This is a description of Project 3.  This is a...</td>
										<td>Systems</td>
										<td>Python</td>
									</tr>
								</tbody>
							</table>
						</form>
						<jsp:include page="pager.jsp"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>