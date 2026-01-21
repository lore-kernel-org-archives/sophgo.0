Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65DC3E8C5F
	for <sophgo@lists.linux.dev>; Wed, 21 Jan 2026 22:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036043; cv=none; b=NPQ+it+SfD0yYtCuKBZK51XV1OofZelrEaQvVoMK7eqLlRToMc7Uq75b8Izikk/jnsQLVVI2nfRqDkmsWSn4y44Z5VDKgA7FgiDdJ5tAgQz2RrfnT17QXqXEHho8WFZQr8Df0owdOgRpKq1lxSR33/msjMWjpzj4Q10fs7PGDX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036043; c=relaxed/simple;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oC5TXHcHhco0ZRv5cPQWj+LiNO5MLzkJken1LOM+8IHqcBmanEXncjPbhPDlvnak//UzAfnoMicw7zPRPuXH6KX8xu45mjSEeTl96qCwhEn8ny2JQPhklSm7RyVVUdqnG1P+1gg8iOT6lkCMF6TRZCKIxq0NcOuS2dkxqijhyYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HRnIqR3t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HRnIqR3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769036034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	b=HRnIqR3t3Rkd7ysV+hJ0eEgVek9bLr0i3uuVycuVcWvN+TPcQmBYxfQAkZi8FrtoLlarEl
	pQOcKXvJz5oPql7klxMX6v1SsKarP8QvmQXVbAl0uS/o0iE9bU8VO4jzI4l8FYJJoXsRq7
	LR84vGtKQTT+t2bdY1nd/iV7psbjeVQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-IY7gtCdsP7-7EaPxmRZ_dQ-1; Wed, 21 Jan 2026 17:53:51 -0500
X-MC-Unique: IY7gtCdsP7-7EaPxmRZ_dQ-1
X-Mimecast-MFC-AGG-ID: IY7gtCdsP7-7EaPxmRZ_dQ_1769036031
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-502aaf2d18bso12606401cf.0
        for <sophgo@lists.linux.dev>; Wed, 21 Jan 2026 14:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036031; x=1769640831;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
        b=j5ToLi+n6ItliYFoD34lfmksDj1dMoRhqL/3JegLffN1ki3O19LRmp1PORP8dW7i72
         kTCszNNNDpVGd+H6oXqUbB8u6KlfauI/u9aqFvY/fKz0lCkJvUUUwj4gCY6rsECE4Bn6
         JxwG2jaH1Mwl3KQGW6ptSxZEnAPTNH1aNu7ZssxKSK17bEQdsjWYukC4Yd3hbXtDfCtJ
         HUDLAkqev6vmCYU5hxtXZw86EgZTjMNI8DVUafmvDedoOWiEt1u3EKwDRTv7GZrEF3VR
         co6vivhIans+SCWB6MdjbElT7g9OWnOEPaW+sPSLcztLtqi2JbCK6DELAOZOQfqKqv8n
         61JA==
X-Forwarded-Encrypted: i=1; AJvYcCWk6dhyFgM2/0Yz3nxqgRQo+7riPXot7lhqXSVuwcmDeQAiXIYdcVqbfGcZOiAridd+jsRBbb8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLtTENDxDRPYpVdhHC4riLOvSSUfa+L3PCwBVNPO39PER7TCzi
	tdyKH8/X5ajxmHNEKjr7JzHMuB8taIrVw3iIDniWS5UXZ14ALBtX83YqOT5x7C2ogzCiuZskwfC
	W3ZsREv2XnunRUbRbLCIJrQo7RiUuAX7zb5fHPpMZlltvIh+btg/EfLgQVg==
X-Gm-Gg: AZuq6aJPonWwWx0aT3imhXl1i10iaefxNp26AzDMbwjnX+4s0NJELUl6HcjrUCqyLg0
	CoJwEk3SNaq5PeCbBmd/lDoCPdFlIXSk96xZEAOQ9Pt3bMhsYdGED76WgKKEJ6oFGk+76vf5sxG
	4MxHRHa6zNKPFwOMMRhQmub0Jeuvwr7sP/6AJJUV42nE6ahtJmkDzxqrKzg1kQQuLLaHcLOkthL
	Vpt9nV0wRnyVK6SIcKHVU2obhbo/nPoZiSh6EyogVhj9lyZRghS6E7RJrp64m27TN1D+b9EBiAz
	rQG1JlVP4xc0vsDGeLKq0r0yqz3AR9KAMDrtFeDp+RF/dlf+3C8ywti3+xHyo/8wI4KjdQKSTej
	2Ipyp6lSN
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87957091cf.13.1769036030779;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87956771cf.13.1769036030338;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f1abb9sm117138811cf.30.2026.01.21.14.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:53:49 -0800 (PST)
Date: Wed, 21 Jan 2026 17:53:44 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Michal Simek <michal.simek@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate()
 and friends
Message-ID: <aXFY-FxqeBv4BsHd@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c_DLIDtQKH0thYxhNlFid1iDGdC7ZCeWPQ40MhNeejU_1769036031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

On Thu, Jan 08, 2026 at 04:16:18PM -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.

I sent you a GIT PULL for what can go to Linus for the upcoming merge
window from this series:

https://lore.kernel.org/linux-clk/aXFYU324yQ6uBmk0@redhat.com/T/#u

Thanks,

Brian

