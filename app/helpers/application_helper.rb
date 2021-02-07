module ApplicationHelper

   
    def profile_pic user
        image_path =  "Red.png"
        
       
        user.image[0] = image_path
        

        if user.image.any? 
            image_path=user.image[0]
        else
            image_path =  "Red.png"
        end
        image_tag(image_path, width: "40px", height: "40px", class: "profile-pic")
    end

end


