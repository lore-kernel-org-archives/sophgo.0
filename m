Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A951DB54C
	for <sophgo@lists.linux.dev>; Sat, 25 Oct 2025 02:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761358222; cv=none; b=RojJ+h3X7gvxUGl/cuJDeof1aojDsSspAKX0ODEqh0HLmp1VTrvZSoNWLMnLhkk0rTKaG3loaDiyUIpFODcBhj6ThXAZqq2JBDZVYpKRjTAVLLW6o730qYvvTaX1KssL2s8LsVe9t0hDwVoe8I1i9sq/nfNHrNOwvwII6RzjrGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761358222; c=relaxed/simple;
	bh=HUS9244ysl59Vq36eIRjlnVv6M6CDzfdg6dsmbE9H9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayWK/gMD6rc3BL0kLSeOkjVQPkJvO3IAVzu8QzFxlIN/ih0mMz0KGn9m1RadjjuclJ1zHbyBH/gJD8xTtxT3Z34DAwN3T2Xzt5FdQzwLzIiKB7pqoBKToz/cK5nsOfRqCT51uFESfwfRRYk+PAav9hgW/O3W3u+3xAvtlh2KPT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oae5do0a; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oae5do0a"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7833765433cso3498491b3a.0
        for <sophgo@lists.linux.dev>; Fri, 24 Oct 2025 19:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761358221; x=1761963021; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/FBYChVgWVnYtUmsOY0fMq3eM8ZJMPYKb26HoqCuHQ=;
        b=Oae5do0a7uLtyIZtcYTxGF0zRtuXkFVW10ivUMyt1upgpJVDotxttyZdeRYEtQNJFz
         fk1HQIPz9c01yQ7mTqSSkGxIoe9nTl25h6iiZ2/Tl3HOJrtxywtJ6wC5uqybq0VJeZLF
         vQNJ1X+12XOesLm8Ve7phNYMUNKDzMOF9yQ1icVyfR1/v2W2wwDMEj/cucMhPppPawFW
         maOJooYGfDRNbzr35LGv7mUEtEC9kaPUSjO0VeRYl3xKWUBx6cmDSA83xt10NduRGwku
         ajvG+W8sY/RmKi+Za/b833qhkdlS7IHGK/Jphq/rfCm6QOYjXX4JA+77bDze8JdueDQw
         MIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761358221; x=1761963021;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/FBYChVgWVnYtUmsOY0fMq3eM8ZJMPYKb26HoqCuHQ=;
        b=KtI352yzWbY8p/NJPTxzMEHyrAZfwxvcpAcTDwIW7BopWmP1/7rS7eAWY2Xb3rWBTu
         G6OALS7ZFBlJ28VsGBuAfBGjR91WLpeabkGunNc1B5UAEyZ2tkLGC+V5RLlsbLak7DIw
         x1r60GhPu5a9J/uL4XLmF4k+CWdBiJ+mtxMdJvOow+Cavl+2YdXDqNWjaLceVAvYHxJe
         p6uSt67fkLzrwSX82ReIJeLLxuG3/aGDkolZURAxmzOPoB+6GukLVokh0NnnjMPP+7+A
         W4zkgjTBSi66UbZHXjw83sizu2FAG1TAB5HosskDB2WRvemkDrIUOH6nN6LVrW7Xse4x
         bdAg==
X-Forwarded-Encrypted: i=1; AJvYcCWiqyQ5/OmfJKbt3mvb5KZi7VEh8hS3GEG91Q9SPa3g+jQ5RdH7hY9V69AWzCntxqrDluySRu8=@lists.linux.dev
X-Gm-Message-State: AOJu0YydWbyzoC5AsTim2Cliz+xHpLy5V5ubTJlDozf0eJGsY7LV/ggR
	D81qFq87CiH2wREyzt5wpwFzYhjDhJ6XTO608hkRDCHHdhobXiE6IIz3
X-Gm-Gg: ASbGncsGPn33e9yTC3PUlLQt5AVdQCV2pCLz2945j2lIII+qk0aeDGOa0BsZIYaN7tp
	wark7ynOwkAIein0u23p5XMH4ThWgmtFwafbzaHYSnt07DeQ7LifN09qk/0oy2hY00Tl6choujC
	DBZ4QIBjhynVxx/oReuKQLp0mrrrCX8Px6YSllSoJcddd7Z44pXYdBWY/kHLKNqeaZl0n38qK8V
	9QYklitGRka5b3JI7R0IX9UEu2YOEDChrl5hskIMP2jf7EHTmUE65WcBrVLiXeTz6o6EeAok7c2
	55xP68G8ndNJr6/1nejtdDBXF+foh61VF7rk1YFtjt54g8Tallf9nc/USTVegONkhwnblL8zWTA
	FuiBuOREAPH3AZRvXk1WxLpw2pT39Ak52gD3OjQd5XMOkth3NT1e+OydGmedIi6MVWQ0VIlPh2O
	Z1
X-Google-Smtp-Source: AGHT+IGxdF3j6/BMru43Wtt8roJ9EkCuO4V8hWSOev8tC8y9D9Mkhnf7FOrlQlXfV5+SHKSZlrr6MA==
X-Received: by 2002:a05:6a00:94d5:b0:780:7eaa:938 with SMTP id d2e1a72fcca58-7a220a7f285mr39262909b3a.12.1761358220535;
        Fri, 24 Oct 2025 19:10:20 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414068cdcsm639966b3a.47.2025.10.24.19.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 19:10:20 -0700 (PDT)
Date: Sat, 25 Oct 2025 10:10:17 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <3pyukscivyj6iarozoll3jmavjleyqe44fu7xhimot4xorm3tw@rjybzefmfkui>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024-hangout-designing-33e96c0d35fc@spud>

On Fri, Oct 24, 2025 at 05:46:03PM +0100, Conor Dooley wrote:
> On Fri, Oct 24, 2025 at 11:05:14AM +0800, Longbin Li wrote:
> > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> 
> Please remind me how it works, sg2000 is just a rebadge and really this
> just refers to one device?
>

SG2000 and CV1800 belong to the same SoC series.
So it's more accurate to describe as “CV18XX/SG200X”.
 
> > access to configure related modules. It includes a usb2 phy and a dma
> > multiplexer.
> >
> > ....
> > 
> > +
> > +description:
> > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > +  register access to configure related modules.
> 
> Here and in the title you have Xs, are those placeholder or is this
> going into cv180x.dtsi and going to be used on multiple devices?
> 

Yes, the “XX” is going to be used in the whole CV18XX/SG200X SoC series.
