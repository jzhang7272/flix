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
