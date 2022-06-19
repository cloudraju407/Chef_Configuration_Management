pipeline { 
	agent { 
		label 'docker-slave1'
	}
	stages { 
        stage('Check Chef connection') { 
		steps { 
			dir('chef-repo') { 
				sh 'knife ssl check' 
				sh 'knife node list' 
				sh 'knife cookbook list' 
				sh 'knife node show node-1' 
				sh 'knife role list'
			}
		}
	}
        stage('Deploy'){ 
		steps { 
			dir('chef-repo') { 
				sh 'knife cookbook upload apache2_cookbook' 
				sh 'knife node run_list set node-1 "recipe[apache2_cookbook::apache2_recipe]"'
			}
		}
	}
	}
}
