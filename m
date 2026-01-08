Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D597B338585
	for <sophgo@lists.linux.dev>; Thu,  8 Jan 2026 21:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907125; cv=none; b=SEV5oeJ/p24QXfnDJ0goMBu4Ues4KOTGua3VEUatywl7Nrf8t4wYuiDH8q8H86iOi73zb0/oj2g69uNfjlckCmaOH9W4wfTXP4nIuyc+y8uZV8dppgTSVAErHNEBrMxhWprkIgkNRG1lEMBtK2nH8ke/1yAaFHRsHGbe9TnKvdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907125; c=relaxed/simple;
	bh=Ge9eXc7hiD/dbOFdwq4ZbwJA1t1aWqrp8YuWJZaaqt8=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=YoCwk6GmJS/IEFUE7I9M1B+TBpkW8expMsH7d2fkqKNzvuaXZmsmT0QVn+NfqxK/9zFXQnPIqXTH52kZcWCJDqLsDmYn+w43rRPJNJHuvPqo7rwkaw1hkNOZ2+0sdTao5d6MZcnGbDvO75VfQL0GiF1m5h9o/4G1IgdFKNfjaeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=evQSZQ/i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="evQSZQ/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fdI4HNVMXpScbiOdWnmJAMr7E0Pkfpku5YlZKipJgA=;
	b=evQSZQ/iESK9ecNgYaOQz9zcD16Yms+nToPRahPorISktxNc6YhHeAm3H49xi8POvtW6wG
	lGewxBnjDT125hw+SSRTgl7ETaUV2t6EAHNmULQ5ZxrEh6sTr8x4gu4zbzsMhSoIUdubYd
	ejY/CvqyZRRJSLj3iu+NQWZKpVh0mU8=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-g70CC_tCPo-x3s0bheO8Yw-1; Thu, 08 Jan 2026 16:18:37 -0500
X-MC-Unique: g70CC_tCPo-x3s0bheO8Yw-1
X-Mimecast-MFC-AGG-ID: g70CC_tCPo-x3s0bheO8Yw_1767907117
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9433e125af6so8532659241.0
        for <sophgo@lists.linux.dev>; Thu, 08 Jan 2026 13:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907117; x=1768511917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/fdI4HNVMXpScbiOdWnmJAMr7E0Pkfpku5YlZKipJgA=;
        b=CwF8gIdHuNYLKoCd+ylbqteNqdUXmUoYRQRaIOsCwlLUnORsJKPnE07I5Ncxc6aON8
         qhCIQF2T4D293DLUAJCUTxAy1ZqgTuodCXzJzLiwpKX04DmSVXNGxVSPJwxEL3gmKu16
         MZ1TCK4Mb0mUTyFJBXnN8zG/tqgb8aQ++P2xDSpygE/N850Hm3dsg39BtltLY/ne9GSL
         g+hYpW6uFSkN97wndXecd8chfuQdZDrBEHMjKdke/3LuTE8qnTq06soa0MqzrDBdrzKU
         IX3B/u48VjKSiwMEpmAP+0lxzQzqLtxkiVIfD8lOyMVj3HbNi9DU0cgayjF6E91M1d7W
         od2w==
X-Forwarded-Encrypted: i=1; AJvYcCWZYqTGGzUXP1qLiJScqNHyEaMR7AtXSmNtTSbzgR3yexTH/ci5KAwRyirT65IGGn4xpGDMbNU=@lists.linux.dev
X-Gm-Message-State: AOJu0YysC3v0SL/+BsPm+QKJ6mbrwvYdlRJ69x2nMJEpj5O8xPBBekbF
	lcfVoOezQV+3euXC/pmqzg4F+NGxsuv+QjbE2FFi+RBRy1gA+t++SRDuy64w3PJg91t1SfJGk7e
	6w+uqimPs7IauV9QPOjdzF/3EXV4NrglfsMdH815HHCw2P3aY5Xb/U/wyAQ==
X-Gm-Gg: AY/fxX785L6CZ1nJEYNdL37cHDz33cjtLD/zA9jId9+y65LNqsQNdnUyb0W5othT86L
	44EPpWsrfmzKptW02ZxBnwDu1yNOXxBvVVZitxvOSPRxBHhfdn86K2XQR1sWxQxoGozkSwdmJ8H
	dF2G6tp0hToX5tzaCqRI0wd9dFxgMAInj/x7nTv3MC6VqbcYbsYTGSBfIQ8wooFP/W/TUZ1YnyZ
	LTxuBTsC4h8QAD01SgU3YufAxGZRN4ze1nwvQcmM+h7bL4iDTVqFJkmO3qUWYPjmWa8O+0cEOOH
	fa8IdkZmzI7/a1cahOTGT0WY6LtnQOkphrpc4RVtbpFyuQ+Wf2lGcSdXF6XwYuqfOUcNo7+Bdwv
	TjpYaFin217Zucic=
X-Received: by 2002:a05:6102:161f:b0:5db:ce49:5c71 with SMTP id ada2fe7eead31-5ecb687fccdmr3306761137.18.1767907117134;
        Thu, 08 Jan 2026 13:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqkSY3g2BRFtVH/hTwOCP8SDHCsAmoUI/QIHDt4YAq9tFbNnfPKjO/MN6CStqRG69amOeAKQ==
X-Received: by 2002:a05:6102:161f:b0:5db:ce49:5c71 with SMTP id ada2fe7eead31-5ecb687fccdmr3306747137.18.1767907116769;
        Thu, 08 Jan 2026 13:18:36 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:36 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:35 -0500
Subject: [PATCH 17/27] clk: sophgo: sg2042-clkgen: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-17-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Ge9eXc7hiD/dbOFdwq4ZbwJA1t1aWqrp8YuWJZaaqt8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HaYum9WmXVj6rbsy2f4dzpsW9yyZHPyW24TnwdtH
 9OOCC5m7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiFecY/te7KlaaCBU3MLco
 CP6oUzgTsVrRaPqa01/lfQzZLs5LV2P4p/smNuhbq3RQ/K9CF/ncXdfal2aUnT3y8Ijd1or3m5/
 PZgQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6Ha6JJebAKRmtW2VTnqCR4YLwxOAd0UYaduP2hIKRW8_1767907117
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Note that this commit also removes a debugging message that's not really
needed.

Fixes: 9a3b6993613d ("clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Chen Wang <unicorn_wang@outlook.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: sophgo@lists.linux.dev
---
 drivers/clk/sophgo/clk-sg2042-clkgen.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
index 683661b71787c9e5428b168502f6fbb30ea9f7da..9725ac4e050a4e6afd3fd50241fbd2fc105a31ca 100644
--- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
+++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
@@ -180,7 +180,6 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
 					     struct clk_rate_request *req)
 {
 	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
-	unsigned long ret_rate;
 	u32 bestdiv;
 
 	/* if read only, just return current value */
@@ -191,17 +190,13 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
 			bestdiv = readl(divider->reg) >> divider->shift;
 			bestdiv &= clk_div_mask(divider->width);
 		}
-		ret_rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
-	} else {
-		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
-					      divider->width, divider->div_flags);
-	}
+		req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
 
-	pr_debug("--> %s: divider_round_rate: val = %ld\n",
-		 clk_hw_get_name(hw), ret_rate);
-	req->rate = ret_rate;
+		return 0;
+	}
 
-	return 0;
+	return divider_determine_rate(hw, req, NULL, divider->width,
+				      divider->div_flags);
 }
 
 static int sg2042_clk_divider_set_rate(struct clk_hw *hw,

-- 
2.52.0

