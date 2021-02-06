module ApplicationHelper

   
    def profile_pic user
        image_path =  "Red.png"
        if user.image.any? 
            image_path=user.image[0]
        end
        image_tag(image_path, width: "40px", height: "40px", class: "profile-pic ")
    end

end


