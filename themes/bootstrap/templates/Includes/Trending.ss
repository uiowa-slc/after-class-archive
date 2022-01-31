            <% with $Calendar %>
            <div class="trending__container">
                <p class="trending__tags"><span class="btn mb-2">Trending:</span>
                <% cached %>
                    <% loop $TrendingTagsAndTypes %>
                        <a href="$Link" class="btn btn-outline-primary mb-2">$Title</a>
                    <% end_loop %>
                <% end_cached %>
                </p>
            </div>
            <% end_with %>
