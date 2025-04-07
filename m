Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1D288A5
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 04:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743998674; cv=none; b=KIpsQMXa6dokAj+0wOucMTLYShQYwPPyukbW/aQ5o2zMtTtPCAR1kMVAp/nftFr4CqqfaUqxPLYeczP/7NKoAiWc6b7149uM3fo27FlNbtoItz4DlbDYgsOzkGqRVEcb1ZzuAMZsnCPdPTc2McTmIb+JebvvWcFrKYiL1KW5E+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743998674; c=relaxed/simple;
	bh=m6Xuj0TJRW756Jn/RBGPzGsbpImEdtEG9o3zvOpUzyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPuJQTctd8NvPpWAiRjIslVEh43Ex2X5sVS5VKwKVbRHs9nfpHbfuhpeqY0L8mYF+210UIv00+rT1cLOdXl/gNdqXrRmQ7Rfu2VtSB2LubG9MO3b67IK7GZB9gdJDtgUvEm8j3+1LohEhH/KLluvdJw2TegGKgfzHl7jMQi3TF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxGCHZUA; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxGCHZUA"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e91d323346so40103946d6.1
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 21:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743998672; x=1744603472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOq1SITZwZx53Waxl1kAcNYG/rxGN0T4WohynMVLlhw=;
        b=XxGCHZUAcvU+2CAQiY9dANCpa3g6saG9Y/jCPDTkf/FH0eBi4E02W0UEo5xLoDFeY/
         5tKE4OSRAHzT4p76inS6D/ZXLrSTPB+eA27qiL9dlSJhla/3SNJvfUWrSBGbwL3R8r2i
         cbJt1ThqDEhnklmyzl2NYSd9SpGWiXCgYa07X2Nf6kPT3LtejJB3p9c5n1aegDQb1BGV
         Ck8NB3LeDmLi8ETfD7zCWq4HtmqMEl3S4knuF0lZP/MiySsCJc1ogpWx4nOGLgX0OqS+
         jlLX+a7GinZaErFwdLtMdq6hw2VH04ePDB7TSntoM+oycRLUxVYkMXS9xcjjBkkO3uIv
         QwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743998672; x=1744603472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOq1SITZwZx53Waxl1kAcNYG/rxGN0T4WohynMVLlhw=;
        b=O/4ZmmO5pX3lW0fDXH8f4OUNXLBfDA1OAHWGgC/GYAy8vXDu69bItBKy+8qeRYrn+K
         NjC60oTdbcQQq7RIZwkJUCR/LxeaS8HqXGrM9wKOLzaD/mUc72A1ftXENxHWuJ66nPsM
         6AebeTxYNqjuf6IQWNopaBqlwZrQ4gLHScPfEOvk0vvHUpKSPUuAyzgjbklf+0Yc23Q6
         tCjqMRMi9SpB8K2WBpltlX+UOfQkGW1Zf2lYGCA2/okug8p09gFnyvD1i52wMF3yIH+x
         xRCzTuI+kxJpmRxayCDKqgzMj5Azio9cnZ3KhDJY/Rj5LCc9kQrtuNgh+Q5BoW6HDFaT
         UkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSSu9JAg4iMBXXZHKyIdd44w5IQaXxLb65lejJ3f72QYuFDDIwHqtkZyeSQQ783ouVo3GEUgw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVCTzPvC0uxElhGLrYHJHX2xZna/f891TNyjudl4oTipGeMbty
	6laILWorfwLP6s5sT5Zu9u4lTm1fdHkfBjvRtZlxt5K+A/7NrHaM
X-Gm-Gg: ASbGnctqAAxBH2oKkzcK/Oh1qlg4QiE64ISLGoFGoREfyrZHHS0+ZFd70cXojDhg2Sh
	BHMGeP80tN1ya+tLGdWc7LpFj+/WeNh8ddooZ1s9eMvzhcnrNbqUN5dAJIMnK/dP11Rm/J7RFDC
	i8vRQTlEAsvmlkcq93A/8/Ni8cJCaby9e3DkDOujT4Naiw86Yy1W91I0n75pZO0IhswVq/V4ssJ
	hMn8+qAxcPW2Y2oq1/HBodQGlPzQAE5bDET6B6qM9+YpqKdLg3FA5aMZTxBekjaS/DXZk9I+Dh8
	YBwZH8Bs0GDd3zniZzOT
X-Google-Smtp-Source: AGHT+IEFWeaPs0k9l/nRl6SOPQWLI77kf3bipNHxa565PpRnQyV/lSkvI2bJRICX3oG/ZiqYwkUBpw==
X-Received: by 2002:a05:6214:1c07:b0:6ea:c5be:f21b with SMTP id 6a1803df08f44-6eff5515024mr175586886d6.13.1743998671997;
        Sun, 06 Apr 2025 21:04:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76ea7ee17sm542867685a.92.2025.04.06.21.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:04:31 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:03:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost <2990955050@qq.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <wqbglycwmrfqxr7cus4vpaksobxvubozx44giwtfnv3ikwvpqn@kszl3yo6mcry>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-6-inochiama@gmail.com>
 <20250407020517-GYA13159@gentoo>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407020517-GYA13159@gentoo>

On Mon, Apr 07, 2025 at 02:05:17AM +0000, Yixun Lan wrote:
> Hi Inochi:
> 
> On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> > The MCU device on SG2044 exposes the same interface as SG2042, which is
> > already supported by the kernel.
> > 
> > Add compatible string for monitor device of SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> > index f0667ac41d75..b76805d39427 100644
> > --- a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> > @@ -11,7 +11,11 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    const: sophgo,sg2042-hwmon-mcu
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,sg2044-hwmon-mcu
> > +          - const: sophgo,sg2042-hwmon-mcu
> > +      - const: sophgo,sg2042-hwmon-mcu
> 
> the compatible added here but not used in dts (or driver), e.g 9/9 patch
> I'd personally prefer to add it when actually being used
> (so it can be validated in the real use cases..)
> 

The dts patch is blocked by the dependency (in most case, it is
the clk). I choose to sumbit these binding patch as they can be
reviewed in early stage so I can throw the dts patch only when
the clk is ready.

In fact, these binding changes are trivial so I think it is okay
to go with the initial patch.

> another concern is whether better to just use 'enum'? (maybe not)
> but I got your idea to fallback to compatible of sophgo,sg2042-hwmon-mcu..
> 
> same with mmc, i2c..
> 

I do not think it is a good idea to use enum. It lost the fallback
info.

Regards,
Inochi
