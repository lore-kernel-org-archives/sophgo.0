Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B78292911
	for <sophgo@lists.linux.dev>; Fri, 23 May 2025 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007074; cv=none; b=rC7w5Jqlnq1xWf0YPvKNyXs92hA7cWqb18hL+HCKry4iI0PE6lfs7Jd4t3w4s7E27zii15drQnwpBc4N2HMoSMrtEMOIPWPOaJxp78ZXWkMLv+hN3Exm/5yS7EWMI1NQt1aWdIV/KRhCW2hpB+Ao7t3ZZsJesNTLHSJQ+3TmJk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007074; c=relaxed/simple;
	bh=x7MXJmmi2wAWHuMNAG2bEFBDQGLJOpgvMJzqXoNhxPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA70auKTaWpFebm1AAUFioQvp5txuiELyyWoQp1w/h4sM0rv2JgvT4oPCWeWcJWnUEFQ9M/BRxoIRS0TVTQpOsMJcUoipdUX6Q25qMhSK7SYK2+6edtEb6e/h24jA7tylPh2wdT8thcpl3JTr91C3JqoulAiyaevwsG6Soj/HFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8VCndAl; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8VCndAl"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b1fde81de05so5480943a12.1
        for <sophgo@lists.linux.dev>; Fri, 23 May 2025 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748007072; x=1748611872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UHviDmj3xu42QGU1Ib9f7zk1dVsPa60dS0RLUI16fXE=;
        b=V8VCndAlR3mswUAgAtlDGZXAriMnFa/nh5ZdZpvzp+6ZmEvY8CoYbW9j2FeUo3M9ue
         FAXUj29CHhDvx7xeTDGbvkuEWBURZbyoKPFOPRqZzzokglIFyiAJdLADcXF375f66/CY
         qif87e+EUIQDT9gZcxn2Ect+5+OvUsOJvzWJm9jdVTD7jzCFs6w2pHXWBVqxy3FH/GYC
         WDnFDoepOuwQ/3s/aw10a4IrlbCmkx2dsqnk3CqrSe5USJTNOmSAX7jESHgIFKV5N98J
         vQb2KqYT25X7BDEwV9FJXg28XOEgn8NW+Yq9k5Zf6/5BuIyO8kLUJ6Hv7M09O7mnK22J
         DGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007072; x=1748611872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHviDmj3xu42QGU1Ib9f7zk1dVsPa60dS0RLUI16fXE=;
        b=wSdQomegxGTQM4D3r6ixlO/WfM7slNHsBral/5mvC4Wbc+7QYEI5tQreXJjvJwLaAm
         5mZu/bdmF+Vn3/MN7FXTz9/FQ+N4Evz/MTrlV/f4jiw1Z+WuJxd/5ZBzaQLCFsDRozFX
         /apOB2J76fznPmqc+ZXHFyEHmzAXHuIcLYv+ckT3GZQejU/KoJDndiC8MZzfcfXm0ILo
         ksdoieszSLZyWVmK+VoXVSIQKk9sjzvoXTGdcRjOD6MAuGONK9PpCGgk5jo0swi26Tmk
         HbwOnV7tSawx95X2txcqobErb8Kx+bfgwMcNNQBKcAvm7mFvJdEpZ9jfLkV1EVLAlb0d
         KSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8v9Hn9tL404d38UPMdR0YqIUtvBaKzuJyOO5T3GSaX2R683mqiUkp/pFAqeMgGdnQXSoOEK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfL4j7YOfiFPqDG4WRn+wHkD7REX0iDJAEFB1r4CvzZRG2+WSx
	oke3bSLs+CEYBOlUhzfz+/xPR1Rhf/FRsi83kfdpQqraIMuh7HfLjuSm
X-Gm-Gg: ASbGncsEgvjxSTvdARW4CHnZTCbKYn86wH5eeFFrMQpoLSvSA9SAaUrHO0g55QtiF3O
	3qdFUYxXW++lD6t91BAulbDwd1E5dTz6CdBBKLrqIa3Q79lkyxjCVEfgijFdfX+kd2wounKJQ0F
	vras8MmUpJqlYNfWGpFtqAS0X1KGE/NRyhPBLBbKzgWnNzj2gWnxWEE9KhJ/YvOTaJEotbiIFxn
	x5OgE0i6nHyw7NzSAgSiVTCSP4WmDK5VjV0a5Hy1KE38KqJZJ6/xSdAWg3gHrGsvmbeBrniKSqM
	1H7kdyPkblVeVC+C2DQT0XtHjMIsl1bPMv32NVnh
X-Google-Smtp-Source: AGHT+IGLbgtx4Af3Q4/lm93aVPuKQYWmNhIgnWUD8AgPn231XjLOFnnKcHeakMtqv3fSR76ZQS0WhQ==
X-Received: by 2002:a17:903:18d:b0:224:c47:cbd with SMTP id d9443c01a7336-231d3257fc6mr419336045ad.0.1748007071336;
        Fri, 23 May 2025 06:31:11 -0700 (PDT)
Received: from localhost ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b26ecfc85e9sm12505536a12.11.2025.05.23.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:31:10 -0700 (PDT)
Date: Fri, 23 May 2025 21:31:07 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
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
	Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org, ziyao@disroot.org
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add bindings for SOPHGO SG2042
Message-ID: <aDB4m6THbV19qjwP@calculate>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
 <20250523-sfg-spifmc-v1-1-4cf16cf3fd2a@gmail.com>
 <5ce44ff6-831b-4128-9fab-7658ffae550f@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ce44ff6-831b-4128-9fab-7658ffae550f@kernel.org>

On Fri, May 23, 2025 at 01:33:13PM +0200, Krzysztof Kozlowski wrote:
> On 23/05/2025 12:54, Zixian Zeng wrote:
> > Add bindings for the SOPHGO SG2042 SPI-NOR flash controller,
> > which is compatible with SOPHGO SG2044.
> > 
> 1. This wasn't tested.
> 2. Breaks existing boards, so you did not test DTS either. Do not
> reviewers but machine for such trivialities.
> 
Sorry, This is my bad. I admit this is a pretty stupid mistake and
I should have run a full dt_bindings check rather than the platform I
am testing currently.
Sorry for taking up your time, I'm sure this is the last time for such
kind of mistake.
> 3. A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
Thank you, I will remove the redundant "bindings" next time.
> 4. Please use subject prefixes matching the subsystem. You can get them
> for example with `git log --oneline -- DIRECTORY_OR_FILE` on the
> directory your patch is touching. For bindings, the preferred subjects
> are explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
Ok, I will do it in next revision.
> Best regards,
> Krzysztof

Thank you again for your detailed revieiws and links

Best regards,
Zixian
