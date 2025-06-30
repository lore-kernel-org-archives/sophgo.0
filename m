Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939A0288CA6
	for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285549; cv=none; b=s3Ype0U9bXrFSMPtBzW/yB/95+7t6I2/e4qs1NowoZgJRB+ujoTf3I0TwWlN36ulRZN3V0t9MQLHjVwlEsHrGjQAvjE2KCd/sfsUKCiUkLAm4Ng/O3Oj7xGRR5AU6tNyDUJ5x66LSt08gVjzbrU//siMk01ac+wmAdEZ/yM4Xo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285549; c=relaxed/simple;
	bh=ymAm2RGsauWyqhaGIKdrhj01x13vqQy3GTjiWCnEznI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m37sPk0s6FyBlELozEH0PjlvbKB/e37PBAxobdScnEuj7XFaP7Pv24o64SUqqe7wGlNKUYnEka93PP9EOT2yalsG+0udDEaOdgJrhOO9f9utVpOWjjeWDcqapNK7mMBgAYF24jo++a91EzAOqY1n9cc4HW63KiA6KC7rfjF4zIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9kKWQxH; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9kKWQxH"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b31d578e774so5073686a12.1
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 05:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751285547; x=1751890347; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kYgTWxigFnMh6J+7o3rXH2dHsX5hLP6u8Al9k3eKS4=;
        b=M9kKWQxHXjANP2UQAmmXC4VdlGl77Lsj+ncVt9IQ2xjTjsZBK3zjLgj762DLHFOGRl
         7IsGEtrrdUJrFVzsed3BRQSNVoGJZAWBqFc41vSigsPQbJdjbZgGdOFsM9vBJgAcYbKC
         qtDZXXyihaDnwkSJ7DU1WlRxAaiguxarnVGvm/nby1h+EjBcnM4uMIVl1IniJomYSRMn
         nJalBtTPbO6xXX1qThevy3mFJyawdlTk73EUib5hjlvfaZXUPIsR+f8+KDxi+L7VCagb
         HKOsVNhxbxdnKie3RfIw2Zp7rlyzB+tffYwRAxZE7jwIQwMQSl78lqnr7v/XaxJJaxK+
         h8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751285547; x=1751890347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kYgTWxigFnMh6J+7o3rXH2dHsX5hLP6u8Al9k3eKS4=;
        b=NQqgnEgKpBQv+v0oFXx0r1uPdtRVmPgqW0k3a/elqmuGX0aiOtHoS1Nq47H4ARaJcj
         yoN9MigWJXG0jZrzyESs4w3zcdbebH1dIlVRJWWjpy0bBO7kbZFne3hIpYRDLmUOBVBm
         Uvhhjg6UhlcjsLYmg44xA827SfZsRWfE4oeN17TqcUtRwxgL0Hv6hl5ZWe0k6STLP1Qa
         8mjLT9CCNU/fbVbrHXosylg+jqsr9jix9vfBTlHvTJyh3nhXvzp23qjHsvpQrwvCMjO7
         xAXAALxH3sykD7qNTXaW7gSmZZGnLsGv7DGG1nwYgmF7ZH9C6w+onhpktQ1sPkgjkFMD
         /siA==
X-Forwarded-Encrypted: i=1; AJvYcCXaTMnU6QEted3sT1M0lcQywDnTVG9gkKeOPUQYyUddHDjD5lkQjecorXMWLQY/nwcVrBzOrpY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUPM/c189BWsKUxisoqUW361Q+9tIbTASGySNyIX2gx9mcP2ej
	XSzuzgQJ4SAIBrugRyjzkJm3GSNgFWjlcABWifaHA2+2eIzAKegNRZE/
X-Gm-Gg: ASbGncuhxs9crcCEksmutnpRI1YvutKgJidLmKWKhVlOUKamkRlAj3v03tst8AQz8zS
	NF8fXjU9CEmGLy7goNGk724f/R69P5xTXom0UbHLoRisIRwLZQU7MVtBzkooAsH3yPrdnG0lAPt
	O75rqVrwqHNdoaxH/QRyuGDrEXWYUgLWqt+YxXs/IXBnvzYNe2PMrKvvLAx/8g4V1ULqXgQ8YRJ
	beIi/XKrZPZSa/nQLqsBCVY2uu7Q0NeWE1JJaf012Yoc/zac6owa/2jB4WB5IcWK7SB39/5nB3/
	V7S3fp9VrPKhoCP3OQHyYDx12YBP/Lv7sUmca5dah4XxeapoZlQ=
X-Google-Smtp-Source: AGHT+IHsIFpQ45mX5GXGIU8w06ZUsQgrAuvEXHa4TYUkn6AoK+LxDTuZVhduM++WcW9fKEEMhIst4g==
X-Received: by 2002:a17:90b:55d0:b0:311:482a:f956 with SMTP id 98e67ed59e1d1-316d69bf0cbmr24097074a91.5.1751285546499;
        Mon, 30 Jun 2025 05:12:26 -0700 (PDT)
Received: from localhost ([2001:250:5800:1002::cd55])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315f54412c6sm13168373a91.43.2025.06.30.05.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:12:25 -0700 (PDT)
Date: Mon, 30 Jun 2025 20:12:22 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
Message-ID: <aGJ_JtThs7VpRIwa@calculate>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
 <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
 <20250630-ancient-quail-of-joy-effd60@krzk-bin>
 <aGJ5XAYZ1nmQyBQT@calculate>
 <4afcef9e-db98-4679-b9c1-40ffcf4861c6@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4afcef9e-db98-4679-b9c1-40ffcf4861c6@kernel.org>

On Mon, Jun 30, 2025 at 01:55:58PM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2025 13:47, Zixian Zeng wrote:
> > On Mon, Jun 30, 2025 at 09:17:09AM +0200, Krzysztof Kozlowski wrote:
> >> On Sun, Jun 29, 2025 at 04:23:10PM +0800, Zixian Zeng wrote:
> >>> SG2042 is not fully compatiable with SG2044,
> >>
> >> Typo, run spellcheck.
> >>
> > Thanks for spotting that! I will add spellcheck to my patch checking script next.
> > 
> >>> So it is necessary to become independent const
> >>
> >> No capital letters after ,.
> >>
> > Ok, thanks
> > 
> >> Anyway, explain why it is not fully compatible.
> >>
> > I have asked the technical staff of SOPHGO,
> > the SG2044 and SG2042 are indeed incompatible with each other in some places
> > because of the hardware details, regarding the configuration of the OPT register
> > and FFTrgLvl(fifo trigger level) bit setting.
> 
> So when driver binds with sg2044, the device does not work? Or what
> exactly does not work?
> 
> All this is supposed to be explained in the commit msg.
> 

I got it, I think I had explained this in the driver patch[3/4].
If this reason is acceptable, I would like to ask whether
the explanation should be put in the binding patch commit msg [1/4]
instead of the driver patch commit msg [3/4]? or both?

Thank you.

> Best regards,
> Krzysztof

Best regards,
Zixian
