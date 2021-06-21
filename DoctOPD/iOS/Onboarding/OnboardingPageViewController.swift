//
//  OnboardingPageViewController.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 22/06/21.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    var orderedViewControllers = [UIViewController]()
    weak var tutorialDelegate: TutorialPageViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self,
                  didUpdatePageCount: orderedViewControllers.count)
        
        orderedViewControllers.append(UIStoryboard(name: APPConstants.StoryboardIdentifiers.ONBOARDING, bundle: nil).instantiateViewController(identifier: APPConstants.OnboardingScreen.ONBOARDING_FIRST_SCREEN))
        orderedViewControllers.append(UIStoryboard(name: APPConstants.StoryboardIdentifiers.ONBOARDING, bundle: nil).instantiateViewController(identifier: APPConstants.OnboardingScreen.ONBOARDING_SECOND_SCREEN))
        orderedViewControllers.append(UIStoryboard(name: APPConstants.StoryboardIdentifiers.ONBOARDING, bundle: nil).instantiateViewController(identifier: APPConstants.OnboardingScreen.ONBOARDING_THIRD_SCREEN))

        
        if let firstViewController = orderedViewControllers.first {
                setViewControllers([firstViewController],
                                   direction: .forward,
                    animated: true,
                    completion: nil)
            }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: UIPageViewControllerDataSource

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                    return nil
                }
                
                let previousIndex = viewControllerIndex - 1
                
                guard previousIndex >= 0 else {
                    return nil
                }
                
                guard orderedViewControllers.count > previousIndex else {
                    return nil
                }
                
                return orderedViewControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                  return nil
              }
              
              let nextIndex = viewControllerIndex + 1
              let orderedViewControllersCount = orderedViewControllers.count

              guard orderedViewControllersCount != nextIndex else {
                  return nil
              }
              
              guard orderedViewControllersCount > nextIndex else {
                  return nil
              }
              
              return orderedViewControllers[nextIndex]
    }
    
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first,
           let index = orderedViewControllers.firstIndex(of: firstViewController) {
            tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageIndex: index)
        }
    }
    
}


protocol TutorialPageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter count: the total number of pages.
     */
    func tutorialPageViewController(tutorialPageViewController: OnboardingPageViewController,
        didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func tutorialPageViewController(tutorialPageViewController: OnboardingPageViewController,
        didUpdatePageIndex index: Int)
    
}
