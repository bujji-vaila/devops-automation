Spring Boot app with Docker DevOps automation

prerequisite: Dcoker must installed  and running.

step1 : write sping boot app using spring initializer(dependency modules, Spring web)

Step 2:Add one endpoint

        @RestController
		@RequestMapping("/")
		@SpringBootApplication
		public class DemoDocker1Application {

			public static void main(String[] args) {
				SpringApplication.run(DemoDocker1Application.class, args);
			}
			
			@GetMapping
			public String greetings() {
				return "hello welcome to docker demo";
			}

		}
   
Step 3: create Dockerfile at root folder

        FROM openjdk:8
		EXPOSE 8080
		ADD target/springboot-docker-devops.jar springboot-docker-devops.jar
		ENTRYPOINT [ "java", "-jar","springboot-docker-devops.jar" ]

      DevOps:
	  jenkin read Docker file --> create image --> push image to dockerhub on each commit
	  
	  Declarative approach

Step 4: Devops auto run  jenkin server and create job 
       
	   select checkbox GitHub project and enter url
	   https://github.com/bujji-vaila/springboot-docker-jenkin/

       select Source Code Management as Git and enter repository url
	   https://github.com/bujji-vaila/springboot-docker-jenkin.git
	   
	   select Build Triggers as Poll SCM
	   crone pattern * * * * *
	   select Build as Invoke top-level Maven targets and enter install
	   
	   to integare docker below plugins are madatory
	   1. CloudBees Docker Build and Publish plugins2. Docker Pipeline
	   3. Docker plugins
	   4. Docker build step
	   after above plugin installed and restarted jenin server then only below option "Build/publish docker image" visible in at Build section Add build step dropdown
	   goto project and configure
	   http://localhost:8080/job/jenkin-docker-integration/configure
	   
	   jenkin must read docker file and build image and deploy in dockerhub
	   select "Build/publish docker image" visible in at Build section Add build step dropdown
	   then enter docker details
	   
	   you can run build job and verify image in dockerhub
	   
	   
	   