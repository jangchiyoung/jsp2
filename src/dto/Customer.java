package dto;
//lombok
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Customer {
	private int idx;
	private String name;
	private String password;
	private String email;
	private String address;
	private String gender;
	private int age;
	private String hobby;

}