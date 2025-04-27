Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393FC217F2E
	for <sophgo@lists.linux.dev>; Sun, 27 Apr 2025 01:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745716080; cv=none; b=s70Rt6dh9ziJB7jT3RdVWCnPs/IAzQbEKTm2rRN5WR9h2gK7qBA+C9Lk//1fy50dF3ooM88QmChD7lGyeQZVaNXyaTprlgo5ijh5gLLmcwuG4lbqyPdzxL/sc7WnVHMoDFKztAox/f3nNo4w0rWGS0+Eikjzu6YC06l9TW+V2ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745716080; c=relaxed/simple;
	bh=Qz3H5UonH+F0Ejh4eB3KlmRFyRFKO6k4cPWFEyvmaN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGhXwFwuvRmgRTGjcCKbQf5GTip2LBamUtoKdG2fGcvok7J7B37bgMhaAxCv/SeKRacdv1Ws7qxZ2Qd8X9BplmmRCqAvTueeaYH4fxDNqAtdMwhhGxO8H5npYwL8qHQtp5yQrROEN3eX/f1GRbqp/qpvvOUp0SwVOYFNOwrLuAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7RhDOov; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7RhDOov"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso4915607a91.1
        for <sophgo@lists.linux.dev>; Sat, 26 Apr 2025 18:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745716078; x=1746320878; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qi/DM2NVeWE17m30+tFBeykLvgqkmQd+TLzeOQAEaxA=;
        b=K7RhDOoveAbhNmBQj5WY5//2pogVNqVUqiHUDM6wGf3I5sd3tHxLmFKHUauvBTCWyH
         NXJdThqTZfRgtBh+x6wK6jyDMmSzACER81vjrMLxequhJInoNmWlE9iEl7DruEHJrrDt
         m4Q59yOAK0uzgy0F8HYHhnphHuH0Ecj5DDoh2tL9tzoLOgMOrCmek4Fu1DuHviADfPWb
         G1ap4Lmnr7mHfb0+ry2S0AddM4Gn2tPy4dxxXRh2sOw2gwoH/5JX6sOfBjGnCCzdoUFq
         X771Bw2AYGux8D81UBwr6yTo+/SDCWv8bPAFO3cC4rOkSrMM5w9b2/k41at+HjBhbj1f
         yQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745716078; x=1746320878;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi/DM2NVeWE17m30+tFBeykLvgqkmQd+TLzeOQAEaxA=;
        b=dPforE+5uRvJOAOxxAaoKFoO5NRhBNrOFcsE/CMkUu+cvWUtTJDUJnWyxaEdA73TP0
         1BBSCb9RyutdrRkCHBCMDhQyBgYCqkiupMTKF7orAC0tViCFjFeb1zjGxBE3GKHOYg3S
         VG4ZWsKtXJlQa/gFg+ZJLfd7jR+cLGXKuYl6Ta0eWCp7NlXM5iXw44RA27QIvMA6ihL6
         1dH9Jp7HvXnetWhqHHaYeIBKsZcMMDakqI7Sm/PLxHB+yU/4kjEXVOO6cipvu7aRrEkI
         n9xF4QIPlJn7VyOdTV8EGpGTBlmqgOID92me2Z8jh514RALVJF4aQMZ7RkoIzq98lRQv
         Xi9A==
X-Forwarded-Encrypted: i=1; AJvYcCVvhNeIPy4t3Rom/XRVR8ziONm/7bCR+7vTy21yVTo2E9n0CCQTYvFrtHgxkkPST2rIwrJF6ok=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLLXkg5UhMctDmaoJY1wvHQCDBd5Y4k8sDXiah3n0MQuWyzQFC
	xj8xvBdRMfEeAOW0nUpFyH/bKurxAZBeBmllNUN0+IkZ7FB45dqf
X-Gm-Gg: ASbGncupx2WMGN1M+6QsZzYVq8gApaIf+gfh6FPjWCyLzb3vyF+rzMDXppoSQtTS6BA
	PN+OEA2dboWEzoiwX40pAv8Ft8wzgvcVcaOXyMwVSgFOTAi1wEg6xsJtZKEyJI1SSxW19Oxg8XL
	ivi6aSew2oQMups2V7qS+oN8kHHYIBPep/6ooo/tnJfvi4B9B8YyZ90phqikhMGF3jDDfvO56X4
	T3IxErighd8bxaKPgHvgAiQSxo95lH2aRp7MXwG0JcKXkO1PJxNGcZFSRaX9P1W83tblEDp6rbo
	5SYr26rM0iotokXQFjCWA5FQbSJe5UHJIZjhV8WURQ==
X-Google-Smtp-Source: AGHT+IEOE2HNR8Z62iAJd3A4G+i2avNNhNGvpebOOqlr1I5tJlN3/vtrc9yI9fUiyGEU1soypp/xSg==
X-Received: by 2002:a17:90b:57c8:b0:2fe:8c22:48b0 with SMTP id 98e67ed59e1d1-309f7dfddc6mr11264812a91.15.1745716078381;
        Sat, 26 Apr 2025 18:07:58 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-309ef1475ccsm6041086a91.44.2025.04.26.18.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 18:07:57 -0700 (PDT)
Date: Sun, 27 Apr 2025 09:07:55 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v3 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Message-ID: <efpbhawsfg7nlp4waxtp366bemzzoznpoikob4ndzzoibs6n3d@6y3jdfw6zrhi>
References: <20250424012335.6246-1-looong.bin@gmail.com>
 <MA0P287MB2262EA042510853498EDD60CFE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA0P287MB2262EA042510853498EDD60CFE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Sat, Apr 26, 2025 at 03:25:18PM +0800, Chen Wang wrote:
> Hi，Longbin
> 
> Seems you missed my "Tested-by" tag for v2.
> 
> Others LGTM,
> 
> Thanks,
> 
> Chen
> 

Sorry! I will add that, thanks.
