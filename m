Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D72366546
	for <sophgo@lists.linux.dev>; Tue, 16 Dec 2025 15:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898715; cv=none; b=naBVVeb4e5WUaHTNgbTf46qUMMAuQvmqQWSjRLWEeS9OpLCS3LMF5glpJoFo0oujqVqLxlwWIAM5F+1z2tE6+Kg7wTi3x2xh4HAg7bLL3BqZT76a9N9mEnbt8ZEeai5N+sKOWkh0oQ8t9Vt4e114GkMTlKOzE4s9Utmi/XaoitA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898715; c=relaxed/simple;
	bh=MDkvhx/UWht+J1EF6yeI4u41iXTnDyRpJQfMIotkrz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpTMrl0Aj95p9eZkE9c6mME3qy7aT3p4k8hIzETBhLMZFuWMnz2JBRq1sVwLZN5MwPgP2LaYlbrM1RslllcDtZW2Jr7D96cOxGm+eGZqSJQzVt8jRrZPq0w9DqWS49NAk9BJcb+fTT79ikVxDYEPqwNjAqnOlq80EKrJWc7Gtqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTuPRNc0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTuPRNc0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a1c28778so52649735e9.3
        for <sophgo@lists.linux.dev>; Tue, 16 Dec 2025 07:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898712; x=1766503512; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GMNrMLkfDebdMnrSKqK61b1HC+YKle22T3SSCNCdsM=;
        b=dTuPRNc0IhbkVKM1IQfl6L575InK2ToRI4Lb8jVPnUQPGpKY9kL9UZO5GtjjDHBLeK
         QAJ9Mjlfk/GOzLSGZxIftNtEoSqMKpNmKQivEOOGtjVbOAOj+KV+y4evo4AChPssH3xM
         JTAVAsyyKxOe/+rNx7Q1o/va8XKID2uSvtS6QWSLMjyhnIYVQyQuWQsSLdz9ABTmivMd
         QyrufJm2S5PViGBkNsFouGmaUc0JJc0izBtbs1A6PmFVxdJoFNSq+/xFLcYjorzjfcQc
         F6MAo6MY2gFbHAg05cbuhO9EQYQ3e/X+q/fvqXvttZJEUgRheM4Ml9E5EmHqLoHOyztk
         +cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898712; x=1766503512;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GMNrMLkfDebdMnrSKqK61b1HC+YKle22T3SSCNCdsM=;
        b=uWhZ9tUjid0fT31gg52p85Hsc5zWEP0RnnTTvJ/P3LpoN6JvR50EDJmRaMh4bMXLb7
         8S1ooFzXRUGp51+Pq4x81cBx3uyGQdxsGNhsKDBJjtsmvQR6ORKc4UB4v8INY2vHFPXp
         HAAtMnNcuLYxnMafs66UVGfZ4wYxyYO58eCS4kLZ2KBIFHH9R/6SW+4wb1lFxKANZsuI
         nr3vgtG8Q5x0NZ5nhZu9Cvz1mKlJzUvjIuspYUIQ3c4N81MWgXP3zAtlGe8QujMnbwZ7
         KUDbx28+EOPM5nGjqx66lR0Sgt0Yq2PNQOm3v1LxIeA3bqmcBA9tF2Blr/LkPh4mXiUP
         gQ0A==
X-Forwarded-Encrypted: i=1; AJvYcCXhx4Uxobf6u4VhG5GFLGNTZfYG1Gtc5hwZXj2zYtfA2S5ToHyYp7XjVaC7V4LwcdnKYiwHSMk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlozpaJegDFR0ooZ8ZBcRAW0KDuHPW+0jzM+p7NYHWkDB76wBH
	Oz5d/KS4LpTvkFenoRDZHVk/xhF6euPt5IXV4aUuGwLa4pWgTdr/aDIq
X-Gm-Gg: AY/fxX57V2likMjq2MFv6hoofV1KF2pRDDT6kLEU3PdHsjUqJYuOCaBS2+EvHCkznx5
	O48itGnoW6++7JeC4RV/+gcbGtun12bZsFerXhTAp3q/qk6Yn7RIYAxtQWeJW+bwpNUOp6UxQBb
	jp1nrMy6FvkdYF5O5MYzeebMG4gB7USTjGfJZr6WpJUQOr/sumxrD8yvZ5glm60Zj4/Qw9jl+3X
	ZH6BaErXIIhSSzLBEY9xqXSZBGIyBmf2RvggjZ8elOo3dfEhIaCA5OAO/ok0+D3r0IdldE5Yatp
	/uLApWlf7d0P5bGAJ5sUKyc/nUYyaEb4o8p1R1thzoVmh0pBNVJsJaAdSJcBjXrySBpu3ymnxM6
	MwhO/uwUDXKn7UNXO5FcJSa52C1Z81+bOiXmZbFsyZ7sWIrvySEMegF9HVJdd/zDWPw8s00s0o8
	BjG36ppBLU++hDIL2UlB7qHluHege6ccyQnsWeD0OWzuVsKf4ZvmDJ
X-Google-Smtp-Source: AGHT+IFV+c61z+DgSxhQNpcRqsr6GKrDffylNeUc9FZ154kyk76iN8prufaBiE8rBuUIXMcUo/WuYg==
X-Received: by 2002:a05:600c:3b05:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47a8f8ab546mr158959185e9.6.1765898711717;
        Tue, 16 Dec 2025 07:25:11 -0800 (PST)
Received: from anton.local (bba-92-98-207-67.alshamil.net.ae. [92.98.207.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4b1347sm270035235e9.8.2025.12.16.07.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:25:11 -0800 (PST)
Date: Tue, 16 Dec 2025 19:25:06 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <aUF4w9sO5lmU9T6v@anton.local>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
References: <20251214224601.598358-1-inochiama@gmail.com>
 <aUE9hDtflXpcgGnX@inochi.infowork>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUE9hDtflXpcgGnX@inochi.infowork>

On Tue, Dec 16, 2025 at 07:09:16PM +0400, Inochi Amaoto wrote:

> Hi Anton,
> 
> Since you have tested this patch before, could you give a Tested-by?
> 
Done. V2 works fine with Milk Duo 256M with 2 channels RX and TX working
simultaneously.


Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
