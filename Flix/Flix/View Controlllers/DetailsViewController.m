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
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    [self.titleLabel sizeToFit];
    [self.synopsisLabel sizeToFit];
    
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
