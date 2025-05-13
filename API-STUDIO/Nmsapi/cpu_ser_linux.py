#LINUX SYSTEM SERVICE STATUS CHECK
import subprocess

def check_service_status_studio(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_studio('apistudio')

def check_service_status_Crudapp(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Crudapp('Facrud')

def check_service_status_Getapi(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Getapi('Getapi')


def check_service_status_Postapi(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Postapi('Postapi')


def check_service_status_Updateapi(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Updateapi('Updateapi')


def check_service_status_Deleteapi(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Deleteapi('Deleteapi')

def check_service_status_Dbschemaapi(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Dbschemaapi('Dbschema')

def check_service_status_Cmspage(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Cmspage('Cmspage')

def check_service_status_Coreapi(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Coreapi('CoreApi')

def check_service_status_Sqlviews(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Sqlviews('Sqlview')

def check_service_status_Authentication(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Authentication('auth')

def check_service_status_Datamigration(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Datamigration('Datamigrate')

def check_service_status_Etlstudio(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Etlstudio('etlstudio')

def check_service_status_Helpdesk(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")

         # Always get detailed status
        status_result = subprocess.run(['systemctl', 'status', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        print(f"Detailed status:\n{status_result.stdout}{status_result.stderr}\n")

    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Helpdesk('helpdesk')


def check_service_status_KMLapi(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
            
         # Always get detailed status
        status_result = subprocess.run(['systemctl', 'status', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        print(f"Detailed status:\n{status_result.stdout}{status_result.stderr}\n")


    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_KMLapi('kml')

# def check_service_status_gstin(service_name):
#     try:
#         # Run the systemctl status command
#         result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
#         # Check the result
#         if result.returncode == 0:
#             print(f"The {service_name} service is running.")
#         else:
#             print(f"The {service_name} service is not running.")
#     except Exception as e:
#         print(f"An error occurred: {e}")

# # Replace 'your-service-name' with the actual service name you want to check
# check_service_status_gstin('gstin')


# def check_service_status_pgsql(service_name):
#     try:
#         # Run the systemctl status command
#         result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
#         # Check the result
#         if result.returncode == 0:
#             print(f"The {service_name} service is running.\n")
#         else:
#             print(f"The {service_name} service is not running.\n")
#     except Exception as e:
#         print(f"An error occurred: {e}")

# # Replace 'your-service-name' with the actual service name you want to check
# check_service_status_pgsql('postgresql-15')

def check_service_status_pgsql(service_name):
    try:
        # Run the systemctl is-active command
        is_active_result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        
        # Check if the service is running
        if is_active_result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
        
        # Always get detailed status
        status_result = subprocess.run(['systemctl', 'status', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        print(f"Detailed status:\n{status_result.stdout}{status_result.stderr}\n")
        
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_pgsql('postgresql-15')



def check_service_status_Nginx_server(service_name):
    try:
        # Run the systemctl status command
        result = subprocess.run(['systemctl', 'is-active', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Check the result
        if result.returncode == 0:
            print(f"The {service_name} service is running.\n")
        else:
            print(f"The {service_name} service is not running.\n")
            
         # Always get detailed status
        status_result = subprocess.run(['systemctl', 'status', service_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        print(f"Detailed status:\n{status_result.stdout}{status_result.stderr}\n")
        
    except Exception as e:
        print(f"An error occurred: {e}")

# Replace 'your-service-name' with the actual service name you want to check
check_service_status_Nginx_server('nginx')