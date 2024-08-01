global class FixUserEmailAddresses implements SandboxPostCopy { 
 
    global FixUserEmailAddresses() {} 
 
    global void runApexClass(SandboxContext context) { 
 
        List<User> adminUsers = [SELECT Id, Email FROM User WHERE Profile.Name = 'System Administrator' AND Email LIKE '%.invalid']; 
        System.debug('Initial list of users: '+adminUsers); 
 
        for(User user : adminUsers) { 
            System.debug('This is the users email @ 1st: '+user.Email); 
            user.Email = user.Email.removeEnd('.invalid'); 
            System.debug('This is your new email: '+user.Email); 
 
        } 
        System.debug('Updated list of users: '+adminUsers); 
        update adminUsers; 
 
    } 
 
}