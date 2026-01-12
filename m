Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4737E37BE7C
	for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768238843; cv=none; b=eogIPtMUlKzwvjtD4oz4aPzaLdG6Sqo2PVyhX54JtatpnmTziEA4yF3Tlo4tk2Jq7YN90agVXF+9sFW4ssThK4L9JozFBin4oAt/mjnn2ylQ4GBCueCLgyRdjtV/dUvBuRZMgU2mVKsGYwG1lwOjizBR8DuY+z1p0stVWFNKdd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768238843; c=relaxed/simple;
	bh=zqidXFk9f2QgplgqJW4bJGmyGdzzOuzyoAcWFCGvl+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hSlsKqy+RtgkuM3irOYm4oOV7uc6gJEHjEPk0L5RIrubCVHFuHCEFz573vvCnTSheHbGv7eMa0N6akXPUNzD7Muc+MhI9DlP+DKICwhxk3l9MQH7mEdQEJq7bgHtlN2PKWeHF4WdchpE80sQY01A4Q4up8t1pYWUgp6nO4Oq34c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uuyh+y5a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uuyh+y5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768238841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o9CPhRuZpJq6EBnHnbZTvPY3sZ/mCOvqRmxNXxppx+A=;
	b=Uuyh+y5aQgaD5cldSSWKaVIlNnketgrUwrp9oYv+KLwRTvtHJb7HDyGFfxaTaNA8SDLEMz
	QEckXu7QI7ZlC0zhSmCjHzSZEgjazbO6ILk95PagW/eTXILaeIzO/vVt7AE+GKNLiRwJv8
	m0tvy3FKKtA1DnWGgGOOfAWCFHlDbvk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-oLwOcGnRNXKDeXJrU7CVAQ-1; Mon, 12 Jan 2026 12:27:19 -0500
X-MC-Unique: oLwOcGnRNXKDeXJrU7CVAQ-1
X-Mimecast-MFC-AGG-ID: oLwOcGnRNXKDeXJrU7CVAQ_1768238839
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a344b86f7so218690036d6.0
        for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 09:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768238839; x=1768843639;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o9CPhRuZpJq6EBnHnbZTvPY3sZ/mCOvqRmxNXxppx+A=;
        b=i9sObjhbpga2hSEJkSLt27EENqCuFEj2EB9dUw0ago/NbZRN6tBg2r9+A9EsBjHEhS
         ogTOmoa0PVbbVBxNtNp6VgOf8Y7Im/8YeyJKPO04rDdKWlxmBWugZSdzG+wz/ngyFJSP
         GutHWXNAQSU64eUTWSuqxxJAyJGjWp8WfG7HNNW/OveMtEaWMWNtdnGGv2Y9FnBV7TAk
         pYUex2kq52oEvBIiNygmxa5h3UD51zH95nQLGUuEvRl44G8Pccai0L0Pu2O2SYzZYonQ
         V/B6ZL9yxeIgvgzvH2X773tl5Z9fTYLNH/Ay9XiO9nQ5wnb7i0xGzbotObi+GRIyOvgE
         o4pg==
X-Forwarded-Encrypted: i=1; AJvYcCVd/u2pAWzHcOGYGwRfK5yIJGLm3bNio4pwH19SkfeQR3KNf+S640pxPL63j6dcDMLf0VqvcLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1KjIJNO8CqkluUyY7zhzoUvnA8EaQXv+byZQwIbdDOzjQC+IX
	BV7LOHaM4CByk8ifXVffNTnUJ/FLryZjZT5iTf9EsYhXiE0MTX6EMSZpxSNBfrZHc7v8afPGMPH
	CfjQjXwt6WKs+fC2f7hCVM9ap489qf74yUbflFXz/JU8Mu3xw6BJ4uVyTPA==
X-Gm-Gg: AY/fxX7A79bQ3GerjzJZ7J44hj2j2XE6qFCd+O58zu1boCWCm4gnCyr4fmlQTwYBFCZ
	taTwtZ1jpYaT/lYOS9JsgYx6UkBzFpHo9qOVl2htCc+UDN93+EZoQD6nxf4E/9a6kYUzBUfv1+f
	MkSyODI90QUauhqvfhE6TOO8k2GIQ2VbxCZPRm6uMWLotGMvSzMpQ/M8xU+3yPqklbTB13RzVnd
	BSXqMS6cX8sdNO86EJ3fHQnJgNn1fFnkPZkbSCTJ2SppZtlN9vVq4Rn5a1ZV2+ngeQyEl8a2k7r
	WAt8YYRAxgdoM2TpEIxQ0invi+6H5gN3uYbNuterkTLev/wgWt4rLnaQeYOU9ewdGA18QM+6ZPl
	ZrfNT/XhWDHZtDOkSaAo4IMi5+zQy5Y4+a9tOaArljzDr
X-Received: by 2002:a05:6214:418f:b0:890:7f0b:4108 with SMTP id 6a1803df08f44-890841b3de6mr262089126d6.25.1768238839247;
        Mon, 12 Jan 2026 09:27:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcDf8b74yP0hUcevb1eT+9bn/MVv1cxFiKn/dxo6t7uQKIDUmb5d2bfYkDmpZFnwIhQzntDw==
X-Received: by 2002:a05:6214:418f:b0:890:7f0b:4108 with SMTP id 6a1803df08f44-890841b3de6mr262088856d6.25.1768238838754;
        Mon, 12 Jan 2026 09:27:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm148766176d6.48.2026.01.12.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:27:17 -0800 (PST)
Date: Mon, 12 Jan 2026 12:27:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev
Subject: Re: [PATCH 17/27] clk: sophgo: sg2042-clkgen: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <aWUu9JmPDgrJ5VxA@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-17-535a3ed73bf3@redhat.com>
 <MA5PR01MB1250095A65211598BF17058E5FE81A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <MA5PR01MB1250095A65211598BF17058E5FE81A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wUNYYhU2ervWx1GIjaLOzhv3xRzlHAxszC3E1bV3DHg_1768238839
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

On Mon, Jan 12, 2026 at 10:57:17AM +0800, Chen Wang wrote:
> 
> On 1/9/2026 5:16 AM, Brian Masney wrote:
> > The divider_round_rate() function is now deprecated, so let's migrate
> > to divider_determine_rate() instead so that this deprecated API can be
> > removed.
> > 
> > Note that when the main function itself was migrated to use
> > determine_rate, this was mistakenly converted to:
> > 
> >      req->rate = divider_round_rate(...)
> > 
> > This is invalid in the case when an error occurs since it can set the
> > rate to a negative value.
> > 
> > Note that this commit also removes a debugging message that's not really
> > needed.
> > 
> > Fixes: 9a3b6993613d ("clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()")
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > ---
> > To: Chen Wang <unicorn_wang@outlook.com>
> > To: Inochi Amaoto <inochiama@gmail.com>
> > Cc: sophgo@lists.linux.dev
> > ---
> >   drivers/clk/sophgo/clk-sg2042-clkgen.c | 15 +++++----------
> >   1 file changed, 5 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > index 683661b71787c9e5428b168502f6fbb30ea9f7da..9725ac4e050a4e6afd3fd50241fbd2fc105a31ca 100644
> > --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > @@ -180,7 +180,6 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
> >   					     struct clk_rate_request *req)
> >   {
> >   	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
> > -	unsigned long ret_rate;
> >   	u32 bestdiv;
> >   	/* if read only, just return current value */
> > @@ -191,17 +190,13 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
> >   			bestdiv = readl(divider->reg) >> divider->shift;
> >   			bestdiv &= clk_div_mask(divider->width);
> >   		}
> > -		ret_rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
> > -	} else {
> > -		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
> > -					      divider->width, divider->div_flags);
> > -	}
> > +		req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
> > -	pr_debug("--> %s: divider_round_rate: val = %ld\n",
> > -		 clk_hw_get_name(hw), ret_rate);
> > -	req->rate = ret_rate;
> > +		return 0;
> > +	}
> > -	return 0;
> > +	return divider_determine_rate(hw, req, NULL, divider->width,
> > +				      divider->div_flags);
> >   }
> >   static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
> Tested-by: Chen Wang <unicorn_wang@outlook.com>
> 
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> 
> BTW: I have a question about the base-commit on which your patch series is
> based. Could you please tell me where I can find this base-commit? I'm
> asking this because I found that for the changes in [25/27] phy-j721e-wiz,
> if I'm based on the latest upstream master, I can't successfully apply this
> patch.
> 
> So, in my testing, I'm based on 6.19-rc1 and haven't picked [25/27].

My branch is based on linux-next-20260105. I verified that this series
also applies to linux-next-20260109. The TI patch depends on patch 9
from this series that's in linux-next:

https://lore.kernel.org/linux-phy/176656156358.817806.16966474957670370356.b4-ty@kernel.org/

Brian

