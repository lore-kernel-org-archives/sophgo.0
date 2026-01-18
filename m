Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19872FD7D5
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 17:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768758962; cv=none; b=q4wnJLikEgHY9esDxOp8po1OCe2Xnyc5LePIR8B8BxX0rUBHPJ1ha8svE0Dr19lUSwmTOEhNZFuKvoqRBL/LTVNMG0vZ7Jv7ra5R1YhiHZFDR8qvKV4tQKao+C2klX5kpbUv7D0NgTu6a4spb5kcoTA3Xlmb/HdKhS/d94aR77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768758962; c=relaxed/simple;
	bh=Cc02viVpEJM5zY+cD0JHltfguubiCXPcNGv6tOSGjus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhyEY1vf/jRmTRQERc/qdgaP3I1+h4I9HNb5x42EeFaXz7fIkonQwA1w4/u6oVzHEJl1gTJ5IFyoFccKf9LPeZKd/Sb5GLKUTbic7P3Te/2Qz9F6TAZU9QWbj0Q0Udy15UJ3gpVvG8oeKbMX1MiBFBBCZaE/UMniRaTFIAN7dSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIkzF4O4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIkzF4O4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so25513815e9.0
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 09:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768758959; x=1769363759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmufyVTFi2Nm8r9yuM1MA+Nz0GRNSPj6jIbhD8ad9xY=;
        b=CIkzF4O4+Q642QQrSU08JmsOVDSyhSXlVrnAPddCT+Dx0pyUJXSc+IR3I6k444zrhW
         IiSUP4OnvRQanQFyLGGsHCrbHXdsAEnyrXnIli5W09WN+RLaBqfsXFGvLya2vUy+M53V
         Sf2c1FplGYsVXP+AT33mTgHOPeXgxAMt9V1J/Hy8m77rl8mI3f9PvXPpY4AvuyvLWLN+
         jMiFSE4ws7lIE9CrhZ9GAuiTSUOpaYoWvsLDcN3o9k8cUfs4k8mwzkVDKGMZ5YBjomci
         I/pTOSAlLfJDTIq7sjlof3PfWMn2/u7pmCJnI2zcLc+9us/z5M0M8QaxUK/UrBaSFoFl
         Y3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768758959; x=1769363759;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmufyVTFi2Nm8r9yuM1MA+Nz0GRNSPj6jIbhD8ad9xY=;
        b=YuYTiPwW4si9YB7J3OzV3l5KQlA4OL4cackJR+KpF7Nec6HniEAP1BAN8WzX+m0ksE
         R9QSvqZQzlRPLyAT57Z/yoNeWY/1ZWdB4my5UZK5K3mzwjbXMU4xuc62D5YiIeqiZpLY
         ZT+nTN5BjIyIsj7w5IcG33Xj78T7mN2owPNJvDHSkM/REpEt6ZmDp+C0K2sOKqWMubUY
         QkzPW21Nnb5tW1erIdp2yjhW7fNJ7ysxs7gHZ4WGOVVHlWwY5vFz/Xr+o9aoFxX2vygA
         X6RteOYYhAmiO5OYouf9ysOURuxLi/Ep1jgO+mL5cKhgYRdO3YQHvVRQP+ZvEG5AMxvQ
         jvkg==
X-Forwarded-Encrypted: i=1; AJvYcCU3irf7nsV0CTw5Io8giURleRqyz0pVOMVoyGd2G4/3i2ZdC+qTOQAbKSu+iIqIhcc8qq6udOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJY/ZYgf/voZUyxaQVdlPPxzltQl8Rj5aIhTTKnPRo5G5Xgxi2
	2CtyMVsoM4WHWkRP6P8oC3L3iAxma5T9TbaaBmQQ0Tdby4k9gEmAnItE
X-Gm-Gg: AY/fxX7xB4Nb+hbk+4vkDBI/tD3XbSO0Wo9uADkp1D4J6rpAdac2WFr0DQg1b/DocxD
	e3ZYVXYa9Ae/b0l6TFKt8dM++hKmecmSZbfRYvnZT/q6wLAoIXLxQZsUY6dKnrKBc5gLcAwDqvv
	5MZgd9OEP5agz0qx5600KZk1Bo44BB58j/Tu5ZL+uqGC+Kl3LX1aJQSNbvFCnHoZuyr1U5PUJd8
	h+5SQrlSIB+gYZ6JGPUsAa7qft4RFEUXmCKGRlTxOC/q83lBIJsrLxfKLy2pNJ7Gg2N1JyozyI3
	C8+r1sSpSFGozk4jeKL+tFffFffHm/vQ9Z+bXqKPR5fHZ1vN2G+Hr4G5K6MCy0+VlpTfOCJkcTO
	50pSqmRjjVAaWBITa36DTLNFPTk4FJXYIORnkGG1k5UHMNUXLHA7pSF5crlUpyMQML6ooRAos5f
	JnVMKu75ZX0Lk0AREouZoQYhD1mADFaLD5Z1osPiuADPY=
X-Received: by 2002:a05:600c:1c24:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-4802590e305mr97146725e9.14.1768758958917;
        Sun, 18 Jan 2026 09:55:58 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d90b3sm154086955e9.15.2026.01.18.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 09:55:58 -0800 (PST)
Date: Sun, 18 Jan 2026 21:55:53 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aW0a9e8Lyv1tu-mZ@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
 <20260118-famous-magnificent-peccary-474ba8@quoll>
 <aW0SikDtd0HIrT4v@anton.local>
 <37bbd795-a0b1-462b-bf0a-2713f79ef2b8@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37bbd795-a0b1-462b-bf0a-2713f79ef2b8@kernel.org>

On Sun, Jan 18, 2026 at 06:32:24PM +0400, Krzysztof Kozlowski wrote:
> On 18/01/2026 18:07, Anton D. Stavinskii wrote:
> > On Sun, Jan 18, 2026 at 11:14:34AM +0400, Krzysztof Kozlowski wrote:
> >>
> >> Please use subject prefixes matching the subsystem. You can get them for
> >> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> >> your patch is touching. For bindings, the preferred subjects are
> >> explained here:
> >> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> > 
> > dt-bindings: sound: sophgo,cv1800b: add I2S/TDM controller
> 
> No. Read again, I even gave you DIRECT doc link!
> 
> > 
> > Is this anyhow better? Also in the documentation directory should go
> > first but I didn't find such examples in git follow. 
> 
> Huh? How so? Where are you looking? 99% of commits have correct prefix.
> Where do you see sound:
> 
> b7d53fe53cb5 ASoC: dt-bindings: rtq9128: Add rtq9154 backward compatible
> 35bffbe49dfd ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
> 70d95c5d2081 ASoC: dt-bindings: rockchip-spdif: Allow "port" node
> f66e7da2a6b1 ASoC: dt-bindings: realtek,rt5640: Allow 7 for
> 101b982654ac ASoC: dt-bindings: realtek,rt5640: Add missing properties/
> b540b4e157c4 ASoC: dt-bindings: realtek,rt5640: Document port node
> 25b858474497 ASoC: dt-bindings: realtek,rt5640: Update jack-detect
> 66b47b9c069f ASoC: dt-bindings: realtek,rt5640: Document mclk

Sorry I'm new to this and learning. For some reason I thought that "binding dir" 
in "<binding dir>: dt-bindings: ..." is actual directory of introduced
file. That is why I said  couldn't find any example because I didn't
find anything with "sound:". Thank you for clarification. 

Got it now(I hope so). Removing sound, adding ASoC. 
Also the word binding removed as you told me

ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM controller

