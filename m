Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1CB1537A7
	for <sophgo@lists.linux.dev>; Mon, 10 Mar 2025 04:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741580661; cv=none; b=VqMSjPKhC12fzua6IYJHxfQk1AfkOm1voFLsK7LYN8wpR+hDPMfG5q8r+/23I9Z0KO9CfavJKdX0HLmEZfJfi6ASkwDVoeao/A70EpUNQ+v9s0agaD1hcXNr8cRF+AYfUEaFzReCTVAtdhyRP/fyKIak6e0eXU5rMvMCP6I9kyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741580661; c=relaxed/simple;
	bh=jpU86pkBhtmDVDFVaA7jCQ8Jvz/mFXJ/l+BRat8AQ4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4CyyOE2XRSkWKskaOn3VgYLKSrvMhb4MR5swv3BffSYh98zRAIyc+hQdoEf4FesvgMJla/kfCguNTC0rnCUfyD3qhcph7upSY0KhNDiFni43wJJA4iTrlppzobZ50g0ekT4ix4IwjU98yupc0UVBapZseRbXJ0Z7bimwvlCl/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSdk2lCw; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSdk2lCw"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c08fc20194so719763385a.2
        for <sophgo@lists.linux.dev>; Sun, 09 Mar 2025 21:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741580659; x=1742185459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLR4GYl4C3Y+wOWYOwtCtosLZeJRF1LxY+mVHw8wlLg=;
        b=MSdk2lCwKr7AgAiWmlDweBgYmnKt4SqofN5XY4xBo7c3fBVGTvHiDCX6aynS57KO6w
         WcMjSj6Q4TnQ2Rqe/AxCIs7du72Xm0/3uFYkjWTt+dryAXMW5TrqpJjSedz4e0vwV59C
         AfU58sEnJJFG7bO7vRYLzYLO4j5NwNsBRzxUyz1qSfKpMrq8hl/q1ZG3xTT48xsFjbVf
         kOFseyMDZK/IXxe3hXNDwwC66KHiNFcrMZLKxbisV7diWz1INGIdjriCjtqt7xofyRhI
         nqt2mjkfyVUIebHYKvnL4NSj3wiJXacBihuqUO0hYoYUC84UgevpvCi6dkKXccQuihIE
         0heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741580659; x=1742185459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLR4GYl4C3Y+wOWYOwtCtosLZeJRF1LxY+mVHw8wlLg=;
        b=mtkOjXvdC8Ubz+nMZnsMijhU/JiUBB+SN8A9vsm3GQFQmF+pExrSSo6huBO9ttRJYe
         VmupL1Ypym29ch0eekQf7dqkETo8KI3GeQZVJvjnzUoNwoheVTi4ZIYjjbW3NQyqFNKZ
         /6z4qeDWkJEb769IXWbCib/z+idqPnIRLLHu7jwSNXjvAiy8Lmhq+ZFFuES02MHmeogP
         /sgZdjwOsO1oK/cGoNHXHm809gTRab4UyjQxfBYKPWuSYd8SAL+d20Lm3eZtokvnb0cV
         Ixt1+rLWKUBViUDxBr02uE6DFXo+c8zbSi0xvRvu6TagAjcAXkcyc54snIYCph9n+Uix
         8kQA==
X-Forwarded-Encrypted: i=1; AJvYcCXqRNd36lVfThYTjLFHQBnCyHj0HF/w+mZ7hJttHjlcIgw9BgpsrslWEOSgcN8hzhhUZ3viL+o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyccxCxTzw1HdpffQ7B+D4T++GWG0k0Wd/fBFsVxBAZviyBdoI3
	qbPjqEdEVSWBU1gYAdC7C91jmjD6X3Nkmbn7Sg/vDz1UM7/qtKBT
X-Gm-Gg: ASbGncvudP05RS+KBxvzNew8sBLx5K2UNrJu3TTBktNKa9n4Oj/TsLuRKqmpEMD7+rW
	XH3i/WshYpMAx83snutbx5YSV4iC9h6IZweyW8ZMRl+ukO4I98KEx5mQEkm/VW+61GzZKYgmKkg
	FLzJx8+tWNTS+UjilgH5rxSiEYjZ67Vc/O20kqZqeEU89geDwn6troKK6E1YgelguSyJD3XlYL5
	8nJhsdrEC4M3ikNCo4SSMrpV8pkV9pZeMT7G7PJmk6vZ8BOA/Dah4fXr/oNi2N1iZ35zWECZl0v
	W3tL6JptQ6s+EaLfuWb3
X-Google-Smtp-Source: AGHT+IFsDYZoGNLIvaPkQwDrN6zTxprNZQsviyohgK7rizxV8r0HlGSZdidW+iOJcbIbr0KSYUqg0w==
X-Received: by 2002:a05:620a:1b85:b0:7c5:4b24:468d with SMTP id af79cd13be357-7c54b244796mr538035285a.2.1741580659215;
        Sun, 09 Mar 2025 21:24:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c5550be065sm107353385a.63.2025.03.09.21.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 21:24:18 -0700 (PDT)
Date: Mon, 10 Mar 2025 12:24:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Richard Cochran <richardcochran@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 0/2] clk: sophgo: add SG2044 clock controller support
Message-ID: <q5776ely5iwzv7uqz52fbzqybujnjfmhe7ujdj6kwqdj5wgaqe@pkkyuptjkmln>
References: <20250226232320.93791-1-inochiama@gmail.com>
 <174157953239.287836.12496608762621997429.b4-ty@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174157953239.287836.12496608762621997429.b4-ty@gmail.com>

On Mon, Mar 10, 2025 at 12:08:32PM +0800, Inochi Amaoto wrote:
> On Thu, 27 Feb 2025 07:23:17 +0800, Inochi Amaoto wrote:
> > The clock controller of SG2044 provides multiple clocks for various
> > IPs on the SoC, including PLL, mux, div and gates. As the PLL and
> > div have obvious changed and do not fit the framework of SG2042,
> > a new implement is provided to handle these.
> > 
> > Changed from v2:
> > 1. Applied Chen Wang' tag
> > 2. patch 2: fix author mail infomation
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [1/2] dt-bindings: clock: sophgo: add clock controller for SG2044
>       https://github.com/sophgo/linux/commit/0332ae22ce09ce64f5e54fc2a24ed22073dbeb9d
> [2/2] clk: sophgo: Add clock controller support for SG2044 SoC
>       https://github.com/sophgo/linux/commit/fcee6f2173e7f7fb39f35899faea282fd9b5ea30
> 
> Thanks,
> Inochi
> 

Please ignore this mail, this point to a wrong url.

Regards,
Inochi
