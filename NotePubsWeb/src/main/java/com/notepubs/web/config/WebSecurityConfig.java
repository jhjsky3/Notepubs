package com.notepubs.web.config;

import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration //객체를 생성해서 담아준다 Configuration : 환경설정
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private DataSource dataSource;
	
	private CustomAuthFailureHandler csFailureHandler;
//	@Autowired
//	private NewlecAuthenticationSuccessHandler successHandler;
//	
//	@Bean // 함수명은 변수명의 형태를 갖는다
//	//Bean은 같은 클래스 안에서 객체 생성 한것을 사용할 때 어노테이션 해주는 것.
//	public NewlecAuthenticationSuccessHandler successHandler() {
//			return new NewlecAuthenticationSuccessHandler();
//	}

	//보안 설정 : 사용자 요청이 올 때 누군되고, 누군 안되고 설정  인증(Authentication) 권한(Authority)
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests() // [/*] : 루트에 있는 페이지들, [/**] : 루트부터 자식의 자손까지 
				.antMatchers("/member/login"
						, "/member/join"
						, "/member/join-confirm"
						, "/member/find-id"
						, "/member/find-pwd"
						, "/member/find-confirm"
						, "/member/upload/**").permitAll() //permitAll:모두 허용하다 //누구나 들어갈수 있도록 설정
				.antMatchers("/member/**").authenticated()//authenticated:공인된 //Member가 기본역할자면 이렇게 가능 / 다른 방법: hasAnyRole("MEMBER")
				.antMatchers("/admin/**").hasAnyRole("ADMIN")//Role : 역할   //antMatchers 설정 경로는 admin만 들어갈 수 있도록 설정
				//any 와 has의 차이점 : hasRole("ADMIN") / hasAnyRole("ADMIN","TEACHER","MEMBER")
				
				//작성하지 않으면 나머지는 anonymous로 처리됨.
				//.anyRequest() .authenticated() 어떤 유저도 인증을 해야한다.
				.and()
			.formLogin() 
				.loginPage("/member/login") /* login page 안내 */ 
				//.loginProcessingUrl("/member/login_process")//post형식으로 요청시 기본설정은 /login -> 원하는 url 설정변경.
				.defaultSuccessUrl("/") /*login 성공 후 이동 페이지 기본 설정*/
				.failureUrl("/member/login?error=true")//.successHandler(successHandler)
				.failureHandler(failureHandler())
				.and()
			.logout()
				.logoutUrl("/member/logout")
				.logoutSuccessUrl("/") /*로그아웃하고 어디로 갈까?*/
				.invalidateHttpSession(true) /*로그아웃 성공시 사용자 세션을 어떻게 할까?? (지워줘)*/
				.and()
			.csrf() /* Cross-site request forgery  -> 톰캣은 기본적으로 막고 있다.*/
				//.ignoringAntMatchers("member/*")  /* 설정 안함 */
				.disable();  /* 설정 안함 */
		
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
	      auth
	         .jdbcAuthentication()
	         .dataSource(dataSource) //ioc container에 담겨있는 dataSource를 사용. application.properties에 작성되 있다.
	         //쿼리  1.사용자 id에 해당되는 정보 2.사용자의 권한
	         .usersByUsernameQuery("select nicname id , password, 1 enabled from Member where nicname=?")
	         .authoritiesByUsernameQuery("SELECT M.nicname id,R.name roleId FROM MemberRole MR "
	         		+ "LEFT JOIN Role R "
	         		+ "ON MR.roleId = R.id "
	         		+ "LEFT JOIN MEMBER M "
	         		+ "ON MR.memberId = M.id "
	         		+ "where M.nicname = ?")
	         //패스워드 암호화 : 어떤 방식의 암호화를 사용할 것인지.
	         .passwordEncoder(new BCryptPasswordEncoder());
			
			
		
			/*auth
				.inMemoryAuthentication()
				.withUser("hong")
					.password("{noop}111")
					.roles("ADMIN","MEMBER")
				.and()
				.withUser("jun")
					.password("222")
					.roles("MEMBER");*/
		
		
//			 사용자 정보를 이용, 로그인 할 수 있는 저장소 3가지.
//			.inMemoryAuthentication() : 메모리에 올라와 있는 사용자정보 사용(57~65 코드) / 규모가 크지 않을 대 
//			.ldapAuthentication()     : window server 에서 사용하는 데이터 관리
//			.jdbcAuthentication()     : 데이터베이스의 있는 사용자 정보사용   
		
	}
	
	@Bean
	public AuthenticationFailureHandler failureHandler() {
		return new CustomAuthFailureHandler();
	}
}
