Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5156E18D
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 01:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741050041; cv=none; b=uktMeEE+AeE2sCVOMsres+UmhBVwujg+XTTIlSvmUvZp/yWw43hB/ceDFz+jlaXd1Qx0M2IL5+aY4NFA9f8Q5nXH/trYHOAdXKEuPryMZE5w+dmUs8bOjpG7Z9KtSAfDBdX8EAidcZNB5tRak426ZFfnOqD1VX66viBGnhGIP4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741050041; c=relaxed/simple;
	bh=U6SJvB2PfUBTckttCxJQcsnQHiDDC2aAWfYCuAZpk2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnGeu2iH+ip6VNLfnlghRhVSFMN12GNdt45Yek6IhS60hlj8TG4FnnJn9Ub70x/+gVsveRC8LXV69hQcRT3GF8JjGBRPKaK5iFnuUv42LyFcDTKXo48NUp4q6BJqNWYw5dujj2LlgM5iTK8XvseLkfpiACXdAVPIu3ByJstoAiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXIshHjb; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXIshHjb"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c3be0d212fso196608085a.2
        for <sophgo@lists.linux.dev>; Mon, 03 Mar 2025 17:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741050039; x=1741654839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ff2JH5f/lHUY528vvAVt0cMf2fGH3mjXbg9TcHWUD+s=;
        b=NXIshHjb82xtDrH3rXrHfJ78ePpiVTA/qRCWT7oSYBEALPBjiPa2VM6fTBjHo1sDSm
         IEfnOdzPBd5e7qkiNl/Ddia5YTegrHOJnqMp6dR3crz7u2ZtUmwd4w5BENCa5LxKVxX6
         LDH7vYuhVyXEqZMTZGE4hBhQhcuMJCLCpY4VsQILtURB5yTIkWrYygkKqTMGg2WT4OQE
         RfVYS/1thoE+1tSxKB8FcudfHXY1Gmr/d63ZRxtUNUyU8W+hnTIIr4WggyL71ScLIFBW
         ogZtt0MzTDZbE/LVURGFtxzhTO/7YzHVCWn7e167kiS801xyCVmUvdPj0vmT6auGk5PG
         34/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741050039; x=1741654839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ff2JH5f/lHUY528vvAVt0cMf2fGH3mjXbg9TcHWUD+s=;
        b=bTs07XJdS0OL8CueYhVJRoULwDaBkEESUSM5pE3boSPkFTofOGCKNw6kGLQd9PztFP
         tl0y+69QyPjJx1Au22OdRytyYHzp6JamaLDnz1C3m+5s7zrl78T7Pwdc+EoLVMV9/9YA
         SFYA6tVfT8cSQC+wcuifeLovVXzQM3NfoCTYAeOnZqXzn5i6DkG0BevmPJ0kVGSozwH6
         8WWztBAB0nbwlCK+A2DRIDQBx4CUfDh2WsG1hZDsTuX5/QV4FO1sRy0oIrbzaROxv/OQ
         ltLgFcadwaqQKBPbbeFR7P6ndD58gpB49FYkr2Za3f4oT8CxvtT0CfQZgjZf8IyIr7u+
         +V/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx47yeEbVaQTxVCxFb6m3PQ6NBGnvkCc3/UCrA9nRDkOvkXro+KcpdWL2vRmaM/sHN30Xa/2M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw115LXp03zwt+zatA6SCG6gMaLQLTXoazC33O2ZmTdgQdYhrA3
	uXl7ECB8yAgdSZvPX6+0PI483jJNna5qRkb7rkUWizf0Me2EDlSd
X-Gm-Gg: ASbGnct8LRqX2S9LXEyAjAaQfGwMxBEa8928F4OPneAUapAimzz0FBm4m3hZYgqr+Cp
	lmhUaHs5/BlhaLa7AGAov4MB5MbHfD3Hwgkrz46U20N0unWtwb1AfQlBmOGnSbaQLxGmYNyDcRH
	s0bU0KW5qLPwjFKwJVazljI5s0bbsbL7/VOkPK7Ur/guT2/HFTQgp2jF7gB1kDSu+1VTiQ1nvj0
	br+5fGWzZN7WzdYIydND6nNhB2lLOb5WXOk5YjrwpHrxR0++n21K9uDTLiu1iuEq19PHslntYeY
	3ztKpcpFQjfCFC2Ad0Qn
X-Google-Smtp-Source: AGHT+IGDdtA40aeEMvGeshE3g5aY0snIpnWT6tZZj/78dDHagcxQsvhw5VDTx9i7ZjrhEMZ0h51lXg==
X-Received: by 2002:a05:620a:8088:b0:7c3:bc90:a46f with SMTP id af79cd13be357-7c3bc90a9bdmr779389785a.24.1741050039185;
        Mon, 03 Mar 2025 17:00:39 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3c0d34fadsm166821085a.12.2025.03.03.17.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 17:00:38 -0800 (PST)
Date: Tue, 4 Mar 2025 09:00:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: Add Sophgo SG2044
 MSI controller
Message-ID: <ihojf2rvfg3nqebovaf7vsc57uwolxnyodkutva64zxptukgv7@wqu3nnbi3yzt>
References: <20250303111648.1337543-1-inochiama@gmail.com>
 <20250303111648.1337543-2-inochiama@gmail.com>
 <20250303-woozy-pluck-c04b13342401@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-woozy-pluck-c04b13342401@spud>

On Mon, Mar 03, 2025 at 04:29:53PM +0000, Conor Dooley wrote:
> On Mon, Mar 03, 2025 at 07:16:46PM +0800, Inochi Amaoto wrote:
> > Like SG2042, SG2044 uses a similar msi controller to provide MSI
> > interrupt for PCIe controllers.
> 
> In the future, could you mention the way in which they differ?
> "similar" could mean 99% the same but incompatible, or 90% the same but
> capable of using a fallback?
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 

It is OK for me. The difference between these two controller
are the number of MSI interrupts supports, and the way to
mask/map MSI message.

I will update the comment message for it.

Regards,
Inochi

