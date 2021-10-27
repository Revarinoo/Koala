//
//  PreviousProjectViewModel.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import Foundation
import Combine

class PreviousProjectViewModel: ObservableObject{
    @Published var previousProjects : [PreviousProject] =
        [PreviousProject(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", reach: 10, impression: 100),PreviousProject(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", reach: 8, impression: 80),PreviousProject(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", reach: 9, impression: 90),PreviousProject(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", reach: 7, impression: 70),PreviousProject(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", reach: 5, impression: 50)]
}
