package model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;

/*
 *  This table in the database will keep track of all
 *  possible colleges/schools a student can choose in 
 *  their profile and which ones a professor can filter
 *  by in their searches
 *  
 *   Table: COLLEGE
 *   
 *   |  ID  |    COLLEGE/SCHOOl      				    |
 *   |  1   | College_of_Agriculture_and_Life_Science   |
 *   |  2   | College_of_Architecture_Art_and_Planning  |
 *   |  3   | College_of_Arts_and_Sciences       		|
 *   |  4   | College_of_Engineering         			|
 *   |  5   | School_of_Hotel_Administration            |
 *   |  6   | College_of_Human_Ecology                  |
 *   |  7   | School_of_Industrial_and_Labor_Relations  |
 *   | ...  |  ...                                      |
 *   
 *   
 *   Table: COLLEGES_TABLE
 *   
 *   | STUD_ID | COLLEGE_ID |
 *   |    1    |     3    |
 *   |    1    |     2   |
 *   |    2    |     5   |
 *   |    3    |     5   |
 *   |    4    |     4   |
 *   |    5    |     1   |
 *   |    6    |     1   |
 *   |   ...   |    ...   |
 */

@Entity(name = "COLLEGE")
public class College extends MultipleItem{
	@Id @Column(name="ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	@Column(name="COLLEGE_SCHOOL")
	private String description;
	
	@ManyToMany(mappedBy = "colleges")
	private List<Student> students;
	
	public College() {
		
	}
	
	College(String name) {
		this.description = name;
	}
	public long getId(){
		return id;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public List<Student> getStudents() {
		return students.subList(0, students.size());
	}
	
	void setDescription(String name) {
		this.description = name;
	}
	
	void addStudent(Student s) {
		if (!students.contains(s)) {
			students.add(s);
			if (!s.getColleges().contains((this))) {
				s.addCollege(this);
			}
		}
	}
	
	void removeStudent(Student s) {
		if (this.students.remove(s)) {
			if (s.getColleges().contains(this)) {
				s.removeCollege(this);
			}
		}
	}
	
	void removeStudents() {
		for (Student s : students) {
			removeStudent(s);
		}
	}

	@Override
	public int compareTo(MultipleItem o) {
		return getDescription().compareTo(o.getDescription());
	}

	@Override
	public MultipleItem create(String name) {
		return new College(name);
	}
}