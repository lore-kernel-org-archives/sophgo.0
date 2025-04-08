Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09D0134B0
	for <sophgo@lists.linux.dev>; Tue,  8 Apr 2025 01:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744077513; cv=none; b=hs8x/uZr8L85d3XDp9Ump32KBmUOfn991Ber+6GYGGXlK08DvzzNclUMRPxFW1xbwHdidfRXdsp1/b9nVIgvEaBnBC+vafcBUDvpFASLuR6t1ILqaqxJr3KLWOYVdyOUwv9NwrTt0MiE8FZhCxYhR/BzrxrpiSNKPxAAR3Dek7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744077513; c=relaxed/simple;
	bh=prcFP3cBCSl+6AOIebN1d9RvItjmT67etGz0szTiOs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0VuLotohyWpStzaVcDb1SXgXModn4S34NesS/BffSUusXnrhhZfBFTRUP/kHHravrhAEHnZ+DQSTvw/9vPLMdf3vOKOL1UN0JP3zKyiNYwLdS79LgSEYAoSJRDFCDcjrim5bhysJZYStdRrNFQdE/VuhWTi7pT33K0C1EKPClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fb/HY+Y+; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb/HY+Y+"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso79032696d6.0
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 18:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744077507; x=1744682307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wA0C35qf2r5ulHhjFJvznSvn1eaLA3vowI+Z+27d7UI=;
        b=fb/HY+Y++B1aHq62tblwra+QGzeXmiQ/lCU3st5YHB/4Fo13wgWkSwqfq9Q0+TVgtg
         opZN8f4Zo13EaV6cUl3o3cOpHUD4H/xrwRoVg7I3CoZSfWfoXlyLYnZaeq7Vt9NOCS4W
         8iv6lBilnNPWR9m0rDCDj/eg2VmfH335bDNwOFK9YE29M6Dx8rB1DdKCnG53ae/Opy58
         kjIF8NQMZ7D1ZTOaNZjFvV1/RGjLWhWw0kHcdWSATw1ha4Zssey3eGn4BIDo76rQM+Bw
         ibfYz6/9qwhwTZ9fSHGhwJRCB3gmhY5QZitaLzVs95LPdipKhhsRPcVF//t/wZmC+fEY
         HIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744077507; x=1744682307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA0C35qf2r5ulHhjFJvznSvn1eaLA3vowI+Z+27d7UI=;
        b=etU6CMc8Y39zWpmMCFNm3AFhmYylnjAQNgngddHEEkN8jS84hfR/qquJNIUg2+Q+vV
         LGo5crOIlpWjz9xqRGJ/mfofsskoAzMvfiq/YIWo4k+QGkp+pXl9zojFEQtSycPaJ1h6
         vmmoV8myk/WtGb2OXoZCaJgDQr3PgaXR64KQJE24rVLEEEbkyVC5ZOy8gzkEF2sZR244
         i6cLe3HKR8/3S3o5SuHRQisBMaXdUYclGAZvtkrKte9e20u8U35rZ/8PXk11qpaXJM6T
         FHVQ026rua3MmiU0H4OYdGm7RSe/7JF3Q/cds1jzIwTu7lbDkPcwxeMdToCTwsQ2gbeU
         rDYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK3jc5idnlCefrSPQTB4Ae8EKj90yEMrkkwHlye7b6aUfUMQuN/YX+07AMYDYCXdP9wXon77A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4ZHXqF6M+Q1Z2O3os2YA5QNW1q8nxCpRTMrFMjBA3/Ji/rsLj
	larj9pUhgYzhqAKPmny/k0qFyYok627M0OPvytZDYs4Nn6Cnhb9+3+EZa8Ii
X-Gm-Gg: ASbGncs46X5DH+DU3CDfzUxVs5t3u/NLNjljem/XzpHd/WQTsSK+a/Ildv0LM3g3Prp
	sxuxEStAvqkeDccbp9GGJQ06IeXgec0Kqrbilupi7sDt5V/eFWss9Z7M1GHKnUuqp3oTxxVA08X
	97DvsVxHkIdt+KGPKP1RU0v1TUUREBlLnSqgzN8coO/sZZj9ujGVZyrIPAYlImkxwqFF7WDZjEA
	81RBPsA0mKb8W59t5iDcOqKY6l945wGz0j384pPlgJnx85cLd8FnyPQBjlAR2tuvrkCmn9lIfzP
	Hu5feyQxovPgvYLbfFLEUWbPGyC1VaA=
X-Google-Smtp-Source: AGHT+IGKXt940d2WnT5dZ67Npfj4M6ycvJnxt5e+7ElGZNZ74lDTPp7xT9blL1C5HT5rNhqMbcc+BA==
X-Received: by 2002:a05:6214:21a6:b0:6ea:d388:dc09 with SMTP id 6a1803df08f44-6f00de70533mr215421436d6.8.1744077005257;
        Mon, 07 Apr 2025 18:50:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0efc060asm66725596d6.1.2025.04.07.18.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:50:04 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:49:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost <2990955050@qq.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of
 Sophgo SRD3-10
Message-ID: <4fhs7v3m7qdyfpqxllm5mbxqnr5i2sa4jkqnwkwnuagky7ql3l@q6o6ohvpgu4h>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-10-inochiama@gmail.com>
 <MA0P287MB22628DD45C86FAD169AEAB15FEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB22628DD45C86FAD169AEAB15FEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, Apr 08, 2025 at 09:40:53AM +0800, Chen Wang wrote:
> Hi,
> 
> I see reset ID in sg2044-reset.h is continous, can we move this file to
> include/dt-bindings/reset ?
> 
> Chen
> 

I do not prefer to move, although the id is continous, it describes the
hardware abi not the software one.

Regards,
Inochi
