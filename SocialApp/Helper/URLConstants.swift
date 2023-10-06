//
//  URLConstants.swift
//  SocialApp
//
//  Created by Rishop Babu on 06/10/23.
//

import Foundation

public enum URLConstants {
    
    static let baseURL = "http://localhost:8000"
    
    // Authentication's
    static let registerURL = baseURL + "/auth/register"
    static let loginURL = baseURL + "/auth/login"
    static let getAllUsersURL = baseURL + "/auth/get_all_users"
    static let getUserURL = baseURL + "/auth/get_user/"
    static let updateUserURL = baseURL + "/auth/update_user/"
    static let updatePasswordURL = baseURL + "/auth/update_password/"
    static let UploadProfilePicURL = baseURL + "/auth/upload_profile_pic/"
    static let getProfilePictureURL = baseURL + "/auth/get_profile_pic_url/"
    static let deleteUserURL = baseURL + "/auth/delete_user/"
    
    
    // Posts
    static let createPostURL = baseURL + "/post/create_post"
    static let getAllPostsURL = baseURL + "/post/get_all_post"
    static let getPostURL = baseURL + "/post/get_user/"
    static let updatePostURL = baseURL + "/post/update_post/"
    static let deletePostURL = baseURL + "/post/delete_post/"
    
    
    // Vote
    static let voreUrl = baseURL + "/vote/post_vote"
    
}
