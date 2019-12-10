package devcom.familiar.form;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserForm {
	private String firstName;
	private String lastName;
	private String userName;
	private String email;
	private String password;
	private String confirmPassword;
	private boolean checkTerms;
}
