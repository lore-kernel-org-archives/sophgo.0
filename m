Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ED51DFE8
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 01:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747185430; cv=none; b=SPUdfrW5V4PABZpX8INfO/dY9Z4bHtuxVJYruxTSfXz+3gdIxHIQjZpxioMKD4HD/F1C2NH/G5CvAt+vu6ERN9mYwo1E11pBVSJocvcDM9ttcPcuEgsAPlMLctJvoo1VX5rHEYC7i+JlaakRWs2UNxRxN4aoDHC6SsCeKAg5hbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747185430; c=relaxed/simple;
	bh=nSrQLIIz5NOYeKv3kZaGWloZT+mJKQ6M7Z/Z39vrA4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9kttIrdSA4BDmVb5XdFaZEMNhbM2TFE/BCTLdNvhS9bdCu9yPsVwDdMf4YwRInw0NCporIIXmqAdbawdcXWTy5Um/JyMIqPhpdoNGTqqFTI+CYzvpKW7223lLJBwwNvGJdd6PNfm2Q4LUrrjfw7i0xL9loKMK45DiQSxGwnjko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3Tswq4V; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3Tswq4V"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f5373067b3so88991416d6.2
        for <sophgo@lists.linux.dev>; Tue, 13 May 2025 18:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747185427; x=1747790227; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEaVOh/9lfsZXQCmNPE6lSqX4P2H8nzTwz/gMp/qKyg=;
        b=Y3Tswq4VTU7JgbHr1AulqAWBk3ql3tbLXBLtd09DVTh4HH1yYa3gmdvXe9VPKcKldQ
         UKKlXQnay28G6nFsedzs3fzXyVivKLYnCQZ04ePbTgqjJ2k3xkdF7soWFRiR7hrm9Y9i
         wk5BgHRLHKYEkBcw+7aq7xf2VGih7UuDChaGcKmXxhJA4HWWjkj3A+WgYzjxcST8cmRD
         PW2mYvMtXVY1+aZsHhZw6JRffxdMKNWchIhPVnXBNoIKaQ+wWN6xbLeFlG0loBucIcsm
         s7Sp7MJo+smclOvp0gOho+oVyG7ua6WcUX/UL6iolEwwTzBX/MYNSmI2BYHFwRR5O+Wj
         jm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747185427; x=1747790227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEaVOh/9lfsZXQCmNPE6lSqX4P2H8nzTwz/gMp/qKyg=;
        b=Jb2OBSrYIlIpLvPpt6+nwiS4hD4Bou8r3bh2/9CrNbpuiEvkCWUKY+pMOCINn+O+PE
         D/HrtvCXCVvPjv1L/8c1mUa7q4qJhTsSmRaGw57Bv4/FbSFMohnRN+VKcQqNT2On4xGh
         slyk9M8kQhXdZBuKJba2/p3fAO9UqwqTr8V4STR5IlQVrZ9CQpVf1//BYCCvInkZSw8U
         6kHlfIt5GMuanxuU9qBRI1K4G6FHwHsN+U+ljZ8PdW4AZmCigDrOywssg0q3t+vatidS
         c56Q5b36wV95IUz0QhCdrRq25UUHFRupUfCNbhbVv1sX4bB4MREGEPh+AXLfTLdhoy6v
         valw==
X-Forwarded-Encrypted: i=1; AJvYcCV3YoCzh2gwm490XLf1jvDygyMew/FWBMnbBZ0s9JouQxFtDWmU8Nymublh1P1OwL7s44jasgw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyddXVwcGTKEit+gEfBeO9vCWu8GgXqXyIDWES8g7MAI/UaDMhm
	KCkA3GwyeX2agGxt7GFiJlc6jnRhohjhPdpILs7zi/U3FK0gjlGL
X-Gm-Gg: ASbGncsWfh90gkuRircnjgWv+WbZTUAc4AG9Lz6iz9zX+cjc24k+Oxg/3FxyWyjO3V2
	LlQWMylyP/2Tx24DDCe5HEJ6PrMAoxRBxxw9LnXeCkOeGPSgFq80aDV3qsFQLancWeMHsxCBPFS
	y6IT+YkBPdgWabtJkRXnXu1LVgOEvk7pEZ/lkv37VwiZ9wCtBmw/AZ8SmkTmMy4tCyErpSvAdB8
	ebrixHDhxuFzqrayovS7eXZwckz/Nn0LLwv+cdGigyCheeqhmGuntfAYVxA1oWoS5v87/+/V0JE
	X+1kZj2NZju5nhrJET2OOYQ8FJU=
X-Google-Smtp-Source: AGHT+IFq80xt7wr+N4Is1nsHfkVqlHuQBXPmL2/8vRvaUgO/7OiqL00yD+wmu1pLVR3Zg8H9LoV5EQ==
X-Received: by 2002:a05:6214:2468:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6f896e4c936mr24184336d6.17.1747185427543;
        Tue, 13 May 2025 18:17:07 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39f588asm74175596d6.49.2025.05.13.18.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 18:17:07 -0700 (PDT)
Date: Wed, 14 May 2025 09:16:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT
 timer
Message-ID: <g45xqtuit7apkduwsfsmw7giqttrb7kjtobejs44rtslx37ynp@ugic2medlczo>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-3-inochiama@gmail.com>
 <aCNYItP6SWImMvFv@mai.linaro.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCNYItP6SWImMvFv@mai.linaro.org>

On Tue, May 13, 2025 at 04:33:06PM +0200, Daniel Lezcano wrote:
> On Mon, Apr 14, 2025 at 06:34:56AM +0800, Inochi Amaoto wrote:
> > Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> > compatible string for SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> 
> Applied patch 2, thanks!
> 

Thanks, as you take this patch, I will drop this one in our repo
to avoid duplicate.

Regards,
Inochi
