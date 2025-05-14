Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68958190068
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232316; cv=none; b=dYFNZ33XRGXqjxUN9siRrWAuNJ2ONoFNn6Pf4+07iQ5RTGCMwgGm+FGNYwXcNhN1pQ75Q4U3LYEMuWi/qu1bVq/7ObC9wsds8yW1vRBPbm/dmuSp9oZFXGGDnA78Wh1OiFZXfM8EnhSD3shLgEwKPZ4Ws1O7VwCKpMJrsT4THOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232316; c=relaxed/simple;
	bh=jHsA7WLaZAQUssN/Gkcz6ehZZJvqAMZ8Q9SHY06sn3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQqcz0vQjclio3jZuSTqZnJzsxaKlkyMbMHeswcO/oUF24hCO5wCC7PWT8anEC0lBuV+GSrree+Kj/AQn6MU8x1KadIASEaJT1auQhC20eUoFehtTg9/wWsrI592R6kZEDTYKJURvbET8eOxB1/rNE/ZjdTa44b8wKcYMhdamvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlDeuXFB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlDeuXFB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so3375353f8f.3
        for <sophgo@lists.linux.dev>; Wed, 14 May 2025 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747232313; x=1747837113; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=vlDeuXFBCiq30OVnu9GG1EvBmdqe/CTqR1HNzoK9FaeG2sAJB5IkySItkHGH+avhbd
         VPU2lvUJ37FOJAUXp5zrJUmfJ7QwD7BBZWtXzpX7D8q9DB6sr3VW9k8RuQRjFwdYMyGr
         1LenLieZY6YUd0RiSUobwYJcw18BRtFMUUUpNNclybmCXjtvq/SXnPxnt+ps6XnVz5xl
         FB75By9Njo0eNbe6Gg4j4TVynyBZXj8japc7Z5CrfM51BHK7ln3VEao9Z8KQrtY2XI7d
         8uZkOuskoUgYkrjilh9lFTEfxg3xxD9U/H/5LXDCySJ0YMDP5OXKEgKzUa2C8EFouFas
         tWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232313; x=1747837113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=noLK2JWhGfUhxPE7ZqcycpH0FEObPxeaA8OapZh737LK45JT/dpEIZAIMdA9ONj8L+
         OaXyPGUQvofTNr+VNHOgTmw2MCH0MiqMcWIzBVS0HT095ytK65aQB+g12L3Y2KHErjAA
         rSjgsA5aEWSfqK2V6FcJr0/rkmRn3NCs9+7wvbZ9McQROFYrY8MZDVq3I0GzEKDMcNKC
         tl9asHw24cJzi7cBJP21roz6pzngcLqXdNfPAOrWHAwSca0iS1dHIDakNMPTpS/6rKWy
         34IFrdTR9OHRmytydcbnC9xt0uqCAnRuou+j2NP0R1wen4NoWbUYDUkBbP0fvV8mWbyJ
         cf5w==
X-Forwarded-Encrypted: i=1; AJvYcCV0khuFmH98qDnkhYm4AwTV9+3u3ERZjshxa2+Q37m4gzOeHJVPCDwTvmCX1JCyMbQlheNCtGE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5R/saUiR/t04AX5W3LzwisZm65tNdm4EPwes9SrSt452OuZLc
	mh5rGCLpWti/Upt/+Gbbi6lw517B5ynbeJFwzQI3PABT4PieC+M5Hk12G47lgDs=
X-Gm-Gg: ASbGnctFNfZR4z7Z20VEtcAnQc6KwTUrunqCEqcYDOdFAGJ+506F6WccmhZ0q/Cw5IM
	cLP4pCPiG5zMWPfFVbW4khHerGy8V8hg0YU4yQDooH/mLAu0HxSRgZNMIRIrxHYtLz/AlGnG9LN
	sSxuZV5WU9xe6BZyi2gZQ1WGyetqGzYycIfKQAfCvG1g+O2+NIIVR+rpOjpi121rkoEy6JUOn/G
	ap9+siei6+vZirxkTRKXd2Dpk6WKbKjbxnbDZ5pTSG4iTIgrVGR/gSUmbYpisE4UjKpBdZLSpYN
	AKep2p4Iq6ic/0tsLYvRn2u3wGdOEu1yHgCp5benRATWOzSsroik4k5+OH+Ek/ylBqAcB/93Ijf
	ofDUJHOSCnT/yyA==
X-Google-Smtp-Source: AGHT+IH4+d+Pry2CNpgKUNvxX7a5CyUBEerUkhvVVYoJxhPCGMW/etsCZMqBlMg4OuejtHCSPvBihg==
X-Received: by 2002:a05:6000:40c9:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-3a3496c1ebdmr3217848f8f.25.1747232312583;
        Wed, 14 May 2025 07:18:32 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm19729450f8f.86.2025.05.14.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:18:31 -0700 (PDT)
Date: Wed, 14 May 2025 16:18:29 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Message-ID: <aCSmNRTVXQ51xj0m@mai.linaro.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407010616.749833-2-inochiama@gmail.com>

On Mon, Apr 07, 2025 at 09:06:06AM +0800, Inochi Amaoto wrote:
> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
