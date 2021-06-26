//
//  DetailsViewController.m
//  Flix
//
//  Created by Josey Zhang on 6/24/21.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailsViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end

@implementation DetailsViewController
//- (void)updateLabelPreferredMaxLayoutWidthToCurrentWidth:(UILabel *)label {
//    label.preferredMaxLayoutWidth =
//        [label alignmentRectForFrame:label.frame].size.width;
//}
//-(void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
////    [self updateLabelPreferredMaxLayoutWidthToCurrentWidth:self.synopsisLabel];
//    [self.view layoutSubviews];
//    self.scrollView.contentSize = self.view.frame.size;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *baseURL = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURL = self.movie[@"poster_path"];
    NSString *fullURL = [baseURL stringByAppendingString:posterURL];
    NSURL *pURL = [NSURL URLWithString:fullURL];
    [self.posterView setImageWithURL:pURL];
    
    NSString *backdropURL = self.movie[@"backdrop_path"];
    NSString *fullBackdropURL = [baseURL stringByAppendingString:backdropURL];
    NSURL *bURL = [NSURL URLWithString:fullBackdropURL];
    [self.backdropView setImageWithURL:bURL];
    
    // Fading in for small image
    NSURLRequest *request = [NSURLRequest requestWithURL:pURL];
    [self.posterView setImageWithURLRequest:request placeholderImage:nil
                                    success:^(NSURLRequest *imageRequest, NSHTTPURLResponse *imageResponse, UIImage *image) {
                                        if (imageResponse) {
                                            NSLog(@"Image was NOT cached, fade in image");
                                            self.posterView.alpha = 0.0;
                                            self.posterView.image = image;
                                            
                                            //Animate UIImageView back to alpha 1 over 0.3sec
                                            [UIView animateWithDuration:0.3 animations:^{
                                               self.posterView.alpha = 1.0;
                                            }];
                                        }
                                        else {
                                            NSLog(@"Image was cached so just update the image");
                                            self.posterView.image = image;
                                        }
                                    }
                                    failure:^(NSURLRequest *request, NSHTTPURLResponse * response, NSError *error) {
                                        // do something for the failure condition
                                    }];
    
    // Low to High Resolution for backdrop
    NSString *urlSmallString = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w45%@", self.movie[@"backdrop_path"]];
    NSURL *urlSmall = [NSURL URLWithString:urlSmallString];
    NSString *urlLargeString = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/original%@", self.movie[@"backdrop_path"]];
    NSURL *urlLarge= [NSURL URLWithString:urlLargeString];
    NSURLRequest *requestSmall = [NSURLRequest requestWithURL:urlSmall];
    NSURLRequest *requestLarge = [NSURLRequest requestWithURL:urlLarge];
    
    __weak DetailsViewController *weakSelf = self;
    [weakSelf.backdropView setImageWithURLRequest:requestSmall
                          placeholderImage:nil
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *smallImage) {
                                       
                                       // smallImageResponse will be nil if the smallImage is already available
                                       // in cache (might want to do something smarter in that case).
                                       weakSelf.backdropView.alpha = 0.0;
                                       weakSelf.backdropView.image = smallImage;
                                       
                                       [UIView animateWithDuration:0.3
                                                        animations:^{
                                                            
                                                            weakSelf.backdropView.alpha = 1.0;
                                                            
                                                        } completion:^(BOOL finished) {
                                                            // The AFNetworking ImageView Category only allows one request to be sent at a time
                                                            // per ImageView. This code must be in the completion block.
                                                            [weakSelf.backdropView setImageWithURLRequest:requestLarge
                                                                                  placeholderImage:smallImage
                                                                                           success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage * largeImage) {
                                                                                                weakSelf.backdropView.image = largeImage;
                                                                                  }
                                                                                           failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                                                               // do something for the failure condition of the large image request
                                                                                               // possibly setting the ImageView's image to a default image
                                                                                           }];
                                                        }];
                                   }
                                   failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                       // do something for the failure condition
                                       // possibly try to get the large image
                                   }];
    
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"overview"];
    NSString *ratingString = [NSString stringWithFormat:@"%@",self.movie[@"vote_average"]];
    double rating = [ratingString doubleValue];
    self.ratingLabel.text = [NSString stringWithFormat:@"Rating: %.1f/10",rating];
    [self.titleLabel sizeToFit];
    [self.synopsisLabel sizeToFit];
    
    self.scrollView.contentSize = self.view.frame.size;
    
    // Add image border
    [self.posterView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [self.posterView.layer setBorderWidth: 2.0];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
