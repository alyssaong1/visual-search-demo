mkdir imdb_metadata

for d in imdb_meta_embedding_json/* ; do
    rn18_embed=`jq .resnet18feats $d`
    rn50_embed=`jq .resnet50feats $d`
    alex_embed=`jq .alexnetfeats $d`
    echo $rn18_embed | sed 's/^.\(.*\).$/\1/;s/ //g' &>> rn18_embeds.txt
    echo $rn50_embed | sed 's/^.\(.*\).$/\1/;s/ //g' &>> rn50_embeds.txt
    echo $alex_embed | sed 's/^.\(.*\).$/\1/;s/ //g' &>> alex_embeds.txt
    basename $d .json &>> filenames.txt
    echo `jq 'del(.resnet18feats, .resnet50feats, .alexnetfeats)' $d` >> imdb_metadata/$d
done



#find imdb_meta_embedding_json/ -type f -exec basename \{\} .txt \; > filenames.txt
